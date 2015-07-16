class SiteController < ApplicationController
  def index
  	@articles = Category.where()

  	render :json => Category.all.to_json(:include => [:articles])
  end
end
