class SiteController < ApplicationController
	caches_action :index
  def index
  	@categories = Category.all
  	@topHeadline = TopHeadline.order('id DESC').limit(3)
  	@today = Time.now
  end

  def update
  	expire_action :action => :index
  	redirect_to "/"
  end
end
