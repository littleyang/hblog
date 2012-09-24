class UserController < ApplicationController
  def register
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def login
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def logout
  end
end
