class SiteController < ApplicationController
	caches_action :index
  
  #--------------------------------------------------------------
  #
  #   The Shitty news
  #
  #--------------------------------------------------------------
  def index
  	@categories = Category.all
  	@topHeadline = TopHeadline.order('id DESC').limit(3)
  	@today = Time.now
    @trending = Article.all.sort_by(&:rank).reverse.take(7)
  end

  #--------------------------------------------------------------
  #
  #   Recap of yesterdays news
  #
  #--------------------------------------------------------------
  def recap
    @categories = Category.all
    @topHeadline = TopHeadline.where("created_at >= ?", Time.zone.now - 1.day).sort_by(&:rank).reverse.take(3)
    @today = Time.now
    @trending = Article.all.sort_by(&:rank).reverse.take(7)
  end

  #--------------------------------------------------------------
  #
  #   About
  #
  #--------------------------------------------------------------
  def about
    @categories = Category.all
    @topHeadline = TopHeadline.order('id DESC').limit(3)
    @today = Time.now
    @trending = Article.all.sort_by(&:rank).reverse.take(7)
  end

  #--------------------------------------------------------------
  #
  #   Run an update and clear the cache
  #
  #--------------------------------------------------------------
  def update
  	expire_action :action => :index
  	redirect_to "/"
  end
end
