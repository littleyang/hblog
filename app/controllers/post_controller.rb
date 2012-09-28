class PostController < ApplicationController
  before_filter :get_link_list,:get_comment_list,:get_category_list,:get_tags_list
  layout "post"


  def index
    #@articles = Article.find(:all).to_json(:include =>[:user,:category,:tags,:comment])
    @articles = Article.where(:status=>1).order("created_at DESC").paginate(:page=> params[:page]||1,:per_page=>10)
    #@articles = Article.all()
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end

  def comment
    if request.post?
        body = params[:comment][:body]
        nikename = params[:comment][:nikename]
        email = params[:comment][:email]
        article =Article.find_by_id(params[:id])
        if user_signed_in?
          u = current_user
          comment = Comment.build_from(article,u,nikename,email,body)
        else
          comment = Comment.build_from_non_user(article,nikename,email,body)
        end
        if comment.save
          flash[:notice]="you have susscessfuly comment the article #{article.title}"
          redirect_to :action=>"view",:id=>article.id and return
        else 
          redirect_to :action=>"index"
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

  def tags_arch
    @tags = Article.tag_counts_on(:tags)
    render :template=>'post/tagarch'
  end

  def category_arch
      @categories = Category.all
      render :template=>'post/catearch'
  end

  def about_me

  end

  def list_with_category
    category = Category.find_by_id(params[:id])
    @articles = (category.article.where(:status=>1)).paginate(:page=>params[:page]||1,:per_page=>10)
    render :template => 'post/index'
  end

  def list_with_tag
    tag = params[:tag]
    @articles = Article.where(:status=>1).tagged_with(tag).paginate(:page=>params[:page]||1,:per_page=>10)
    render :template=>'post/index'
  end

  protected
  def get_category_list
    @categories = Category.all
    #respond_to do |format|
    #  format.json {render json: @categories}
    #end
  end

  def get_comment_list
    @comments = Comment.order("created_at DESC").limit(10)
    #respond_to do |format|
    #    format.json { render json: @comments }
    #end
  end
  def get_link_list
    @links = Link.all
    #respond_to do |format|
    #  format.json { render json: @links }
    #end
  end

  def get_tags_list
      @tags = Article.tag_counts_on(:tags).limit(50)
  end


end
