class Admin::AdminController < ApplicationController
  before_filter :should_login

  def index
  end

  def AddArticle

  end

  def DeleteArticle

  end

  def ModifyArticle

  end

  def CategoryMan

  end
  def CategoryAdd

  end
  def CommentMan

  end

  def DeleteComment

  end
  
  def UserMan

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
