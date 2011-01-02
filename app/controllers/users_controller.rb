class UsersController < ApplicationController
  respond_to :html
  
  def new
    @user = User.new
    respond_with(@user)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account has been successfully created. Welcome to blockq."
    end
    respond_with(@user)
  end
  
  def show
    @user = User.find(params[:id])
    respond_with(@user)
  end
  
  def login
    @user = User.find_by_username[params[:username]
    if @user.present?
      cookies.permanent[:user_id] = @user.id
    end
  end
  
end
