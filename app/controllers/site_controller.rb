class SiteController < ApplicationController
  def index
  	@categories = Category.all
  	@topHeadline = TopHeadline.order('id DESC').first
  	@today = Time.now
  end
end
