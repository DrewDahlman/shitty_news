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

							## Create a source
							source = Source.where(:title => item.title, :link => item.link, :url_id => url.id).first_or_create
						end
					rescue

					end
					
  			end
  		end
  	end
		puts "Completed Scrape..."
		Rake::Task['scrape_feeds:create'].invoke
  end

  #--------------------------------------------------------------
  #
  #   Write some articles
  #
  #--------------------------------------------------------------
  task create: :environment do 

  	## Loop over the categories
		Category.all.each do | cat |

			## Define our sources based on the category
			sources = cat.sources

			## Create empty dictionary to use
			tmp_dict = ""

			## Loop over the sources
			sources.each do | source |
				## Fill the dictionary
				tmp_dict = tmp_dict + source.title.to_s.downcase + " \n "
			end

			## Start the generator
			generator = MarkovChains::Generator.new(tmp_dict, 1)
			article = generator.get_sentences( 1 )
			puts "Category: #{cat.title}"
			puts article[0].capitalize.gsub("  ", " ")
			puts ""
		end
  end
end
