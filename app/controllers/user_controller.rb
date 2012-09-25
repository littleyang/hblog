class UserController < ApplicationController
  def register
    if request.post?
      user = User.new(params[:user])
      if user.save
        flash[:notice] = "you have successfully register"
        redirect_to :action=>"login" and return
      end
    end
  end

  def login
    if request.post?
      password=params[:user][:userPassword]
      username=params[:user][:userName]
      user = User.authentication(username,password)
      if user
        session[:user_id]=user.id
        session[:username]=user.userName
        flash[:notice]="you have successfully login !"
        redirect_to :action=>"index",:controller=>"admin" and return
      end
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="you have successfully logout the blog!"
    redirect_to :action=>"index",:controller=>"post" and return
  end
end
