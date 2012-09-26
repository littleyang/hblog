class Admin::AdminController < ApplicationController
  before_filter :should_login
  def index
    #for the index page,to list some info about site,include comment/recent post/and some other info

  end

  def add_article

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
