# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

#--------------------------------------------------------------
#
#   Create the categories
#
#--------------------------------------------------------------
categories = [
	{
		:title => "World News",
		:slug => "world_news",
		:urls => [
			'http://www.reddit.com/r/worldnews/.rss',
			'http://www.reddit.com/r/news/.rss',
			'http://feeds.feedburner.com/MSNBC/',
			'http://feeds.foxnews.com/foxnews/latest',
			'http://feeds.foxnews.com/foxnews/most-popular',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://feeds.foxnews.com/foxnews/world',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'http://rss.cnn.com/rss/cnn_world.rss',
			'http://feeds2.feedburner.com/time/topstories',
		]
	},
	{
		:title => "Technology",
		:slug => "technology",
		:urls => [
			'http://www.reddit.com/r/technology/.rss',
			'http://feeds.feedburner.com/Wired/',
			'http://www.wired.com/category/gear/feed/',
			'http://www.wired.com/category/reviews/feed/',
			'http://www.wired.com/category/threatlevel/feed/',
			'http://feeds.feedburner.com/Mashable/',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://feeds.foxnews.com/foxnews/science',
			'http://feeds.foxnews.com/foxnews/tech',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'http://rss.cnn.com/rss/cnn_tech.rss',
			'http://feeds.feedburner.com/TechCrunch/',
		]
	},
	{
		:title => "Politics",
		:slug => "politics",
		:urls => [
			'http://feeds.foxnews.com/foxnews/latest',
			'http://www.reddit.com/r/politics/.rss',
			'http://feeds.foxnews.com/foxnews/most-popular',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'http://rss.cnn.com/rss/cnn_allpolitics.rss',
			'http://feeds2.feedburner.com/time/topstories',
		]
	},
	{
		:title => "News",
		:slug => "news",
		:urls => [
			'http://www.reddit.com/r/news/.rss',
			'http://feeds.feedburner.com/MSNBC/',
			'http://feeds.feedburner.com/CBSnews/',
			'http://feeds.feedburner.com/Mashable/',
			'http://feeds.foxnews.com/foxnews/latest',
			'http://feeds.foxnews.com/foxnews/most-popular',
			'http://feeds.foxnews.com/foxnews/politics',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://feeds.foxnews.com/foxnews/national',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'http://rss.cnn.com/rss/cnn_us.rss',
			'http://feeds2.feedburner.com/time/topstories',
		]
	},
	{
		:title => "Gaming",
		:slug => "gaming",
		:urls => [
			'http://www.reddit.com/r/gaming/.rss',
			'http://www.wired.com/category/reviews/feed/',
			'http://feeds.foxnews.com/foxnews/opinion',		]
	},
	{
		:title => "Business",
		:slug => "business",
		:urls => [
			'http://feeds.feedburner.com/businessweek/',
			'http://feeds.feedburner.com/bloomberg/',
			'http://www.wired.com/category/business/feed/',
			'http://feeds.feedburner.com/Mashable/',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'http://rss.cnn.com/rss/money_latest.rss',
			'https://www.reddit.com/r/business/.rss',
			'https://www.reddit.com/r/finance/.rss'
		]
	},
	{
		:title => "Science",
		:slug => "science",
		:urls => [
			'http://www.wired.com/category/science/feed/',
			'http://www.wired.com/category/science/science-blogs/feed/',
			'http://feeds.feedburner.com/Mashable/',
			'http://feeds.foxnews.com/foxnews/opinion',
			'http://feeds.foxnews.com/foxnews/science',
			'http://rss.cnn.com/rss/cnn_topstories.rss',
			'https://www.reddit.com/r/science/.rss',
			'https://www.reddit.com/r/shittyaskscience/.rss'
		]
	},
	{
		:title => "Sports",
		:slug => "sports",
		:urls => [
			'http://www.nfl.com/rss/rsslanding?searchString=home',
			'http://www.nfl.com/rss/rsslanding?searchString=gamehighlightsVideo',
			'http://www.nhl.com/rss/news.xml',
			'http://www.nba.com/rss/nba_rss.xml',
			'http://www.fifa.com/rss/index.xml',
			'http://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=mlb',
			'http://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=nascar',
			'http://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=tennis',
			'http://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=olympics',
			'https://www.reddit.com/r/nfl/.rss'
		]
	}
]

categories.each do | c |
	# Create the category
	cat = Category.where(:title => c[:title], :slug => c[:slug]).first_or_create

	# Create the category urls
	c[:urls].each do | s |
		Url.where(:url => s, :category_id => cat.id).first_or_create
	end
end
