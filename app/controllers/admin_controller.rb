class AdminController < ApplicationController
  #before_filter :should_login
  layout "admin"

  def index
    #for the index page,to list some info about site,include comment/recent post/and some other info

    session[:user_id]=1

  end

  def add_article
    #render :template=>'admin/add'
    #if request.post?
    #  article = Article.new
    #  article.title = params[:title]
    #  article.content = params[:content]
    #  article.category_id = params[:category_id]
    #  if article.save
    #    flash[:notice] = "successfully"
    #  end
   #end
   # if request.post?
   #   article = Artilce.new
   #   article.title = params[:article][:title]
   #   article.content = params[:article][:content]
   #   article.user = @current_user
   #   if article.save
   #     redirect_to :action=>"article_man"
   #   end
   #   end
    @article = Article.new
    respond_to do |format|
      format.html
      format.json {render json: @article }
    end

  end

  def save_article
      @article = Artilce.new(params[:article])
      @article.user = @current_user
      if @article.save
        redirect_to :action=>"article_man"
      end
  end
  def article_man

  end

  def delete_article

  end

  def modify_article

  end

  #category function 
  def category_man

  end
  def add_cotegory

  end
  def delete_category

  end
  def modify_comment

  end
  # comment manager funtion 
  def comment_man

  end

  def delete_comment

  end


  #personal info function man
  def info_man

  end

  def add_info

  end
  def delete_info

  end
  def midify_info

  end

  #links function 
  def link_man

  end
  def add_link

  end
  def delete_link

  end
  def modify_link

  end

  def site_set

  end

  def user_man

  end

  protected
  
  def should_login
    unless session[:user_id]
      flash[:notice]="you should login first"
      redirect_to :action=>"login",:controller=>"user"
      return false
    end
  end

end
