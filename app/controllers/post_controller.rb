class PostController < ApplicationController
  def index
    #@articles = Article.find(:all).to_json(:include =>[:user,:category,:tags,:comment])
    @articles = Article.find(:all)
    respond_to do |format|
      format.html
      format.json { render json: @articles }
      end
  end

  def comment
  end

  def view
  end

  def ArticleArch

  end




end
