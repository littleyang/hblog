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
    if request.post?
      if session[:user_id]
        u = User.find_by_id(session[:user_id])
      end
      body = params[:comment][:body]
      nikename = params[:comment][:nikename]
      email = params[:comment][:email]
      article =Article.find_by_id(params[:id])
      comment = Comment.build_from(article,u,nikename,email,body)
      if comment.save
        flash[:notice]="you have susscessfuly comment the article #{article.title}"
        redirect_to :action=>"view",:id=>article.id and return
      end
    end
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

  def list_with_category
    category = Category.find_by_id(params[:id])
    @articles = (category.article).paginate(:page=>params[:page]||1,:per_page=>10)
    render :template => 'post/index'
  end

  def list_with_tag
    tag = params[:tag]
    @articles = Article.tagged_with(tag).paginate(:page=>params[:page]||1,:per_page=>10)
    render :template=>'post/index'
  end

  protected
  def get_category_list
    @categorys = Category.all
    return @categorys
  end
  def get_comment_list
    @comments = Comment.order("created_at DESC").limit(10)
    return @comments
  end
  def get_link_list
    @links = Link.all
    return @links
  end

end
