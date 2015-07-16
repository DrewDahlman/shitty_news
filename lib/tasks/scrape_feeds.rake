require 'rss'
require 'open-uri'
require 'action_view'
require 'markov_chains'
require 'marky_markov'

namespace :scrape_feeds do

	#--------------------------------------------------------------
	#
	#   Scrape our feeds
	#
	#--------------------------------------------------------------
  desc "Scrape our feeds"
  task scrape: :environment do

  	## Categories
  	categories = Category.all

  	## Loop over each of them
  	categories.each do | category |

  		## Loop over each URL
  		category.urls.each do | url |

  			## Create the source URL
  			source_url = url.url

  			## Open the RSS feed
  			open(source_url) do |rss|

  				begin
	  				## Parse the feed
						feed = RSS::Parser.parse(rss)

						## Loop over each feed item
						feed.items.each do |item|

							if item.title != nil && item.link != nil
									## Create a source
									source = Source.where(:title => item.title, :link => item.link, :url_id => url.id).first_or_create
							end
						end
					rescue

					end

  			end
  		end
  	end
		Rake::Task['scrape_feeds:create'].invoke
  end

  #--------------------------------------------------------------
  #
  #   Write some articles
  #
  #--------------------------------------------------------------
  task create: :environment do 

  	top_dict = ""

  	## Loop over the categories
		Category.where.not(slug: 'top_headline').each do | cat |

			## Define our sources based on the category
			sources = cat.sources.where(["sources.created_at > ?", 3.hours.ago])
			$i = 0
			while $i < 2
				## Create empty dictionary to use
				tmp_dict = ""

				## Loop over the sources
				sources.each do | source |
					## Fill the dictionary
					tmp_dict = tmp_dict + source.title.to_s.downcase + " \n "
					top_dict = top_dict + source.title.to_s.downcase + " \n "
				end

				## Make the chains
				begin
					## Start the generator
					generator = MarkovChains::Generator.new(tmp_dict, 1)

					## Mod the text a bit
					title = generator.get_sentences( 1 )[0].capitalize.gsub("  ", " ")
					
					## if it's long enough but not too long let it pass if not keep moving...
					if title.length > 5 && title.split(" ").length < 30

						# Print it, it's perfect!
						Article.where( :title => title, :category_id => cat.id).first_or_create
						$i += 1
					end
				rescue

				end
			end
		end
		
		## Make todays top headline
		generator = MarkovChains::Generator.new(top_dict, 1)

		## Mod the text a bit
		title = generator.get_sentences( 1 )[0].capitalize.gsub("  ", " ")

		## Ship it!
		TopHeadline.create(:title => title)
  end
end
