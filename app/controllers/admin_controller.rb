class AdminController < ApplicationController

  before_filter :authenticate_user!
  layout "admin"

  #before_filter :should_login
  def index
    #for the index page,to list some info about site,include comment/recent post/and some other info

  end
  #############################article_man_function#################################
  ##################################################################################
  ##################################################################################
  #to add an article
  def add_article
      render :template=>'admin/add_article' 
      @article = Article.new
      #respond_to do |format|
      #  format.html { render :template=>'admin/add_article' }
      #end
  end
  #to save the article from the action add_article
  #adn return
  def save_article
      if params[:id]
        @article = Article.find_by_id(params[:id])
        if @article.update_attributes(params[:article])
            redirect_to  :action=>"article_man",:controller=>"admin"
            flash[:notice] = "you have successfully post #{@article.title}"
        else
            format.html { render action: "add_article",:controller=>"admin" }
            format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      else
        @article = Article.new(params[:article])
        @article.user = current_user
        if @article.save
          redirect_to  :action=>"article_man",:controller=>"admin"
          flash[:notice] = "you have successfully post #{@article.title}"
        else
          format.html { render action: "add_article",:controller=>"admin" }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    #@article.tags_list = params([:article][:tags])
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
    @article = Article.find_by_id(params[:id])
    @article.status = 2
    if @article.save
      redirect_to :action =>"article_man",:controller=>"admin" and return
      flash[:notice]="you had successfully to move #{@article.title} to draft!"
    end
  end
  def publish_article
    @article = Article.find_by_id(params[:id])
    @article.status = 1
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
      if @category.update_attributes(params[:category])
        redirect_to :action=>"category_man",:controller=>"admin" and return
        flash[:notice]="you have successfully added/modify category #{@category.categoryName}"
      end
    else
      @category = Category.new(params[:category])
      if @category.save
        redirect_to :action=>"category_man",:controller=>"admin" and return
        flash[:notice]="you have successfully added/modify category #{@category.categoryName}"
      end
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
      format.html { render :template =>'admin/comment_man'}
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

  def confirm_comment
    comment = Comment.find_by_id(params[:id])
    comment.status = true
    if comment.save
      redirect_to :action =>"view",:controller =>"post",:id=>comment.article.id
      flash[:notice] = "you have pass the comment #{ comment.title }"
    else
      redirect_to :action=>"comment_man",:controller=>"admin"
      flash[:notice] = "something went wrong ! please try again "
    end
  end

  def view_comment
    @comment = Comment.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :template=>'admin/view_comment'}
      format.json { render json: @comment }
    end
  end
  def check_comment
    @comments = Comment.find_all_by_status(false)
    respond_to do |format|
      format.html { render :template=>'admin/comment_man' }
      format.json { render json: @comments }
    end
  end
  ########################################################################
  #######################----------------------------#####################
  ##################-----personal info function man-----##################
  #######################----------------------------#####################
  ########################################################################
  def info_man
    @infos = Info.order("created_at DESC")
    respond_to do |format|
      format.html { render :template=>'admin/info_man' }
      format.json { render json: @infos }
    end
  end

  def add_info
    render :template=>'admin/add_info' 
   # @info = Info.new
   # respond_to do |format|
   #   format.html { render :template=>'admin/add_info' }
   # end
  end
  def save_info
    if params[:id]
      info = Info.find_by_id(params[:id])
      if info.update_attributes(params[:info])
        redirect_to :action=>"info_man",:controller=>"admin"
        flash[:notice]="you have successfully update the info #{info.title}"
      else
        redirect_to :action=>"add_info",:controller=>"admin"
        flash[:notice]="something went wrong,please try again "
      end
    else
      info = Info.new(params[:info])
      info.user = current_user
      if info.save
        redirect_to :action=>"info_man",:controller=>"admin"
        flash[:notice]="you have successfully update the info #{info.title}"
      else
        redirect_to :action=>"add_info",:controller=>"admin"
        flash[:notice]="something went wrong,please try again "
      end
    end
  end
  def delete_info
     info = Info.find_by_id(params[:id])
     if info.destroy
       redirect_to :action=>"info_man",:controller=>"admin"
       flash[:notice]="you have successfully update the info #{info.title}"
     end
  end
  def modify_info
    @info = Info.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :template=>'admin/add_info' }
      format.json { render json: @info }
    end
  end

  def active_info
    info = Info.find_by_id(params[:id])
    info.status = true
    if info.save
      redirect_to :action=>"index",:controller=>"post"
      flash[:notice] = "you have scuuessfully actived information #{info.title}"
    end
  end
  def unactive_info
    info = Info.find_by_id(params[:id])
    info.status = false
    if info.save
      redirect_to :action=>"index",:controller=>"post"
      flash[:notice] = "you have scuuessfully actived information #{info.title}"
    end
  end

  ##################################################################################
  #########################--------------------------------#########################
  #########################------links function -----------#########################
  #########################--------------------------------#########################
  ##################################################################################
  def link_man
    @links = Link.order("created_at DESC")
    respond_to do |format|
      format.html { render :template=>'admin/link_man' }
      format.json { render json: @links }
    end
  end
  def add_link
    render :template=>'admin/add_link'
    @link = Link.new
  end
  def delete_link
    link =Link.find_by_id(params[:id])
    if link.destroy
      redirect_to :action=>"link_man",:controller=>"admin"
      flash[:notice] = "you have successfully destroy the link #{link.title}"
    end
  end
  def modify_link
    #render :template => 'admin/add_link'
    @link = Link.find_by_id(params[:id])
    respond_to do |format|
      format.html { render :template => 'admin/add_link'}
      format.json { render json: @link }
    end

  end
  def save_link
    if params[:id]
      @link = Link.find_by_id(params[:id])
      @link.title = params[:link][:title]
      @link.linkDesc = params[:link][:linkDesc]
      @link.url = params[:link][:url]
    else
      @link = Link.new(params[:link])
    end
    #@link.user = current_user
    u = User.find_by_id(1)
    @link.user = u
    if @link.save
      flash[:notice]="you have successfully modify or create link #{@link.title}"
      redirect_to :action=>"link_man",:controller =>"admin"
    end
  end
  #to set the blog
  def site_set

  end

  #to manager user who post
  def user_man

  end
  def add_user

  end
  def view_user

  end
  def modify_user

  end
  def delete_user

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
