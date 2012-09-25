class PostController < ApplicationController
  layout "post"

  def index
    #@articles = Article.find(:all).to_json(:include =>[:user,:category,:tags,:comment])
    @articles = Article.paginate(:page=> params[:page]||1,:per_page=>10)
    #@articles = Article.all()
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def comment
  end

  def view
    @article = Article.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def ArticleArch

  end

  def list_by_category

  end

  def list_by_tag

  end

end
