class PostController < ApplicationController
  def index
    #@articles = Article.find(:all).to_json(:include =>[:user,:category,:tags,:comment])
    @articles = Article.find(:all)

    @post = Category.all
    respond_to do |format|
      format.html
      format.json { render json: @articles }
      format.json { render json: @post }
      end

  end

  def comment
  end

  def view
  end

  def add
    @article = Article.new
    respond_to do  |format|
      format.html
      format.json{ render json: @article }
    end
  end

  def ArticleArch

  end




end
