class ArticleController < ApplicationController

  def index
  	
  end

  def show
    @today = Time.now
    @categories = Category.all
    @article = Article.find_by_hash_url(params[:hash_url])
    @views = @article.views
    @views = @views + 1

    @article.views = @views
    @article.save
  end

  def featured
    @today = Time.now
    @categories = Category.all
    @article = TopHeadline.find_by_hash_url(params[:hash_url])
    @views = @article.views
    @views = @views + 1

    @article.views = @views
    @article.save
  end
end
