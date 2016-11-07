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
			'https://www.reddit.com/r/worldnews/.rss',
			'https://www.reddit.com/r/news/.rss',
			'https://feeds.feedburner.com/MSNBC/',
			'https://feeds.foxnews.com/foxnews/latest',
			'https://feeds.foxnews.com/foxnews/most-popular',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://feeds.foxnews.com/foxnews/world',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://rss.cnn.com/rss/cnn_world.rss',
			'https://feeds2.feedburner.com/time/topstories',
			'https://feeds.feedburner.com/TheOnion/',
			'https://www.wsj.com/xml/rss/3_7085.xml',
			'https://feeds.feedburner.com/BBCWorldNews/',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Technology",
		:slug => "technology",
		:urls => [
			'https://www.reddit.com/r/technology/.rss',
			'https://feeds.feedburner.com/Wired/',
			'https://www.wired.com/category/gear/feed/',
			'https://www.wired.com/category/reviews/feed/',
			'https://www.wired.com/category/threatlevel/feed/',
			'https://feeds.feedburner.com/Mashable/',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://feeds.foxnews.com/foxnews/science',
			'https://feeds.foxnews.com/foxnews/tech',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://rss.cnn.com/rss/cnn_tech.rss',
			'https://feeds.feedburner.com/TechCrunch/',
			'https://www.theverge.com/rss/frontpage',
			'https://www.wsj.com/xml/rss/3_7455.xml',
			'https://feeds.feedburner.com/BBCTechnology/',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Politics",
		:slug => "politics",
		:urls => [
			'https://feeds.foxnews.com/foxnews/latest',
			'https://www.reddit.com/r/politics/.rss',
			'https://feeds.foxnews.com/foxnews/most-popular',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://rss.cnn.com/rss/cnn_allpolitics.rss',
			'https://feeds2.feedburner.com/time/topstories',
			'https://feeds.feedburner.com/TheOnion/',
			'https://feeds.feedburner.com/BBCPolitics/',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "News",
		:slug => "news",
		:urls => [
			'https://www.reddit.com/r/news/.rss',
			'https://feeds.feedburner.com/MSNBC/',
			'https://feeds.feedburner.com/CBSnews/',
			'https://feeds.feedburner.com/Mashable/',
			'https://feeds.foxnews.com/foxnews/latest',
			'https://feeds.foxnews.com/foxnews/most-popular',
			'https://feeds.foxnews.com/foxnews/politics',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://feeds.foxnews.com/foxnews/national',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://rss.cnn.com/rss/cnn_us.rss',
			'https://feeds2.feedburner.com/time/topstories',
			'https://feeds.feedburner.com/TheOnion/',
			'https://feeds.feedburner.com/BBCNews/',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Gaming",
		:slug => "gaming",
		:urls => [
			'https://www.reddit.com/r/gaming/.rss',
			'https://www.wired.com/category/reviews/feed/',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Business",
		:slug => "business",
		:urls => [
			'https://feeds.feedburner.com/businessweek/',
			'https://feeds.feedburner.com/bloomberg/',
			'https://www.wired.com/category/business/feed/',
			'https://feeds.feedburner.com/Mashable/',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://rss.cnn.com/rss/money_latest.rss',
			'https://www.reddit.com/r/business/.rss',
			'https://www.reddit.com/r/finance/.rss',
			'https://feeds.feedburner.com/TheOnion/',
			'https://www.wsj.com/xml/rss/3_7014.xml',
			'https://www.wsj.com/xml/rss/3_7031.xml',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Science",
		:slug => "science",
		:urls => [
			'https://www.wired.com/category/science/feed/',
			'https://www.wired.com/category/science/science-blogs/feed/',
			'https://feeds.feedburner.com/Mashable/',
			'https://feeds.foxnews.com/foxnews/opinion',
			'https://feeds.foxnews.com/foxnews/science',
			'https://rss.cnn.com/rss/cnn_topstories.rss',
			'https://www.reddit.com/r/science/.rss',
			'https://www.reddit.com/r/shittyaskscience/.rss',
			'https://feeds.feedburner.com/TheOnion/',
			'https://feeds.feedburner.com/BBCScience/',
			'https://www.reddit.com/r/nottheonion/.rss'
		]
	},
	{
		:title => "Sports",
		:slug => "sports",
		:urls => [
			'https://www.nfl.com/rss/rsslanding?searchString=home',
			'https://www.nfl.com/rss/rsslanding?searchString=gamehighlightsVideo',
			'https://www.nhl.com/rss/news.xml',
			'https://www.nba.com/rss/nba_rss.xml',
			'https://www.fifa.com/rss/index.xml',
			'https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=mlb',
			'https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=nascar',
			'https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=tennis',
			'https://api.foxsports.com/v1/rss?partnerKey=zBaFxRyGKCfxBagJG9b8pqLyndmvo7UU&tag=olympics',
			'https://www.reddit.com/r/nfl/.rss',
			'https://www.reddit.com/r/nottheonion/.rss'
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
