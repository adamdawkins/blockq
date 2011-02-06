class TagsController < ApplicationController
  respond_to :html
  
  before_filter :find_user, :only => [:index]
  
  def show 
    @tag = Tag.find(params[:id])
    respond_with(@tag)
  end
  
  def index
    @tags = @user.tags
  end
  
  
  private
  def find_user
    @user = User.find(params[:user_id])
  end
  
end
