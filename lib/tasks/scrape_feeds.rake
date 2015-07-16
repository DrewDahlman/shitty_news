require 'rss'
require 'open-uri'
require 'action_view'
require 'markov_chains'
require 'marky_markov'
require 'flickraw'

namespace :scrape_feeds do

	#--------------------------------------------------------------
	#
	#   Scrape our feeds
	#
	#--------------------------------------------------------------
  desc "Scrape our feeds"
  task scrape: :environment do

  	## Categories
  	categories = Category.all.order("RANDOM()")

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
			while $i < rand(1..3)
				## Create empty dictionary to use
				tmp_dict = ""

				## Loop over the sources
				sources.each do | source |
					## Fill the dictionary
					tmp_dict = tmp_dict + source.title.to_s.downcase + " \n "
					top_dict = top_dict + source.title.to_s.downcase + " \n "

					## Check for any images
					source.content
				end

				## Make the chains
				begin
					## Start the generator
					# generator = MarkovChains::Generator.new(tmp_dict, 1)
					markov = MarkyMarkov::TemporaryDictionary.new
					markov.parse_string tmp_dict

					## Mod the text a bit
					# title = generator.get_sentences( 1 )[0].capitalize.gsub("  ", " ")
					title = markov.generate_n_sentences 1
					title = title.capitalize.gsub("  ", " ")
					
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
		# generator = MarkovChains::Generator.new(top_dict, 1)
		markov = MarkyMarkov::TemporaryDictionary.new
		markov.parse_string top_dict

		## Mod the text a bit
		# title = generator.get_sentences( 1 )[0].capitalize.gsub("  ", " ")
		title = markov.generate_n_sentences 1
		title = title.capitalize.gsub("  ", " ")

		## Get a flicker image
		FlickRaw.api_key = ENV["FLICKR_KEY"]
		FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
		
		terms = ['news','sports','technology','nature','politics','animals']

		args = {
			tags: "#{terms[rand(0..5)]}",
			tag_mode: "all",
			per_page: 500
		}
		 
		while true	
			pictures = flickr.photos.search(args).to_a
			pic = pictures.sample
			info = flickr.photos.getInfo(photo_id: pic['id'])

			break if info.respond_to? :originalsecret
		end
		

		open(FlickRaw.url_o info) do |src|
			binary = src.read
			open("public/flickr.jpg", 'wb') { |f| f.write binary }
		end

		## Ship it!
		headline = TopHeadline.new()
		headline.title = title
		headline.photo = File.open("public/flickr.jpg")
		headline.save

		## Expire the cache
		session = ActionDispatch::Integration::Session.new(Rails.application)
	  session.get "/update"
  end
end
