require 'rss'
require 'open-uri'
require 'action_view'
require 'markov_chains'
require 'marky_markov'
require 'flickraw'

namespace :shitty_tweets do

	#--------------------------------------------------------------
	#
	#   Post a couple of tweets
	#
	#--------------------------------------------------------------
  task tweet: :environment do
  	client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
		  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
		  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
		  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
		end

		## Get most recent posts
		recent_articles = Article.where('created_at > ?', 2.hours.ago).order('RANDOM()').limit(2)

		## create our tweet
		recent_articles.each do | article |
			hash_tag = article.category.title.gsub(' ','')
			tweet = "##{hash_tag} #{ActionController::Base.helpers.strip_tags(article.title)}"
			tweet = tweet.truncate(110, omission: '...', separator: ' ')
			tweet = "#{tweet} http://shitty.news/#{article.category.slug}/#{article.hash_url}"

			## Tweet it
			client.update(tweet)
		end
  	
  end

  task tweet_popular: :environment do 
  	client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
		  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
		  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
		  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
		end

		## get the tops
		top_headlines = Article.where('created_at > ?', 12.hours.ago).order('views DESC').limit(2)

		## create our tweet
		top_headlines.each do | article |
			hash_tag = article.category.title.gsub(' ','')
			tweet = "#trending ##{hash_tag} #{ActionController::Base.helpers.strip_tags(article.title)}"
			tweet = tweet.truncate(110, omission: '...', separator: ' ')
			tweet = "#{tweet} http://shitty.news/#{article.category.slug}/#{article.hash_url}"

			## Tweet it
			client.update(tweet)
		end

  end
end
