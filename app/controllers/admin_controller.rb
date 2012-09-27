class AdminController < ApplicationController
  #before_filter :should_login
  layout "admin"

  def index
    #for the index page,to list some info about site,include comment/recent post/and some other info

    session[:user_id]=1

  end
  #############################article_man_function#################################
  ##################################################################################
  ##################################################################################
  #to add an article
  def add_article
      @article = Article.new
      respond_to do |format|
        format.html
        format.json {render json: @article }
      end
  end
  #to save the article from the action add_article
  #adn return
  def save_article
      if params[:id]
        @article = Article.find_by_id(params[:id])
      else
       @article = Article.new(params[:article])
      end
       #@article.tags_list = params([:article][:tags])
      if @article.save
        redirect_to  :action=>"article_man",:controller=>"admin"
        flash[:notice] = "you have successfully post #{@article.title}"
      else
        format.html { render action: "add_article",:controller=>"admin" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end

  end
  # list all articles in database
  def article_man
    @articles = Article.where(:status=>1).paginate(:page=>params[:page]||1,:per_page=>15)
    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end
  #list all article in draft
  def draft_article
    @articles = Article.where(:status=>2).paginate(:page=>params[:page]||1,:per_page=>15)
    respond_to do |format|
      format.html { render :template=>'admin/article_man'}
      format.json { render json: @articles }
    end
  end

  # delete and article
  def delete_article
      article = Article.find_by_id(params[:id])
      if article.destroy
        redirect_to :action =>"article_man",:controller=>"admin" and return
        flash[:notice]="you had successfully destroied #{@article.title} !"
      end
  end

  #move an article to draft
  def move_to_draft
    @article = Article.find_by_id(:params[:id])
    @article.status = 2
    if @article.save
      redirect_to :action =>"article_man",:controller=>"admin" and return
      flash[:notice]="you had successfully to move #{@article.title} to draft!"
    end
  end
  def modify_article
    @article = Article.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :template => 'admin/add_article'}
      format.json { render json: @article }
    end
  end
  #def modify_save
  #  @article = Article.find_by_id(params[:id])
  #  if @article.update_attributes(params[:article])
  #    #@article.save
  #      redirect_to :action =>"article_man",:controller=>"admin" and return
  #      flash[:notice]="you had successfully to modify #{@article.title}"
  #  end
  #end
  #######################################################################################
  #############------------------------------------------------------####################
  #############-----------------------category function--------------####################
  #############------------------------------------------------------####################
  #######################################################################################
  def category_man
    @categories = Category.order("created_at DESC")
    respond_to do | format |
      format.html
      format.json { render json: @categories }
    end
  end
  def add_cotegory
    render :template=>'admin/add_category'
    @category = Category.new
  end
  def save_category
    if params[:id]
      @category = Category.find_by_id(params[:id])
    else
      @category = Category.new(params[:category])
    end
    if @category.save
      redirect_to :action=>"category_man",:controller=>"admin" and return
      flash[:notice]="you have successfully added/modify category #{@category.categoryName}"
    end
  end
  def delete_category
    category = Category.find_by_id(params[:id])
    if category.article.count > 0
      render :js=>"alert('could not delete,it has some article')"
      redirect_to :action=>"category_man",:action=>"admin"
    elsif category.destroy
      redirect_to :action=>"category_man",:controller=>"admin"
      flash[:notice] = " successfully delete the category #{category.categoryName}"
    else
      render :js=>"alert('some went wrong,roolback!')"
      redirect_to :action=>"category_man",:action=>"admin"
    end
  end
  def modify_category
    #render :template=>'admin/add_category'
    @category = Category.find_by_id(params[:id])
    respond_to do | format |
      format.html { render :template=>'admin/add_category'}
      format.json { render json: @category }
    end
  end
  #def cate_modify_save
  #  @category = Category.find_by_id(params[:id])
  #  if @category.update_attributes(params[:category])
  #    flash[:notice] = " you have successfully modify category #{@categoy.categoryName}"
  #    redirect_to :action=>"category_man",:controller=>"admin"
  #  end
  #end

  ##########################################################################################
  ##################----------------------------------------################################
  ##################------comments managerment function------###############################
  ##################----------------------------------------################################
  ##########################################################################################
  # comment manager funtion 
  def comment_man
    @comments = Comment.order("created_at DESC")
    respond_to do |format|
      format.html
      format.json { render json: @comments }
    end 
  end

  def delete_comment
      comment = Comment.find_by_id(params[:id])
      if comment.destroy
        flash[:notice] = "you have successfully delete the commet #{comment.title}"
        redirect_to :action=>"comment_man",:controller=>"admin"
      end
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

  def active_info

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

  #to set the blog
  def site_set

  end

  #to manager user who post
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
