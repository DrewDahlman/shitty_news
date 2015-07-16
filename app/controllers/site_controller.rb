class SiteController < ApplicationController
  def index
  	@categories = Category.all
  	@topHeadline = TopHeadline.order('id DESC').first
  	@today = Time.now

  	# render :json => Category.all.to_json(:include => [:articles])
  end
end
