class PostController < ApplicationController
  layout "post"


  def index
    #@articles = Article.find(:all).to_json(:include =>[:user,:category,:tags,:comment])
    @articles = Article.paginate(:page=> params[:page]||1,:per_page=>10)
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
