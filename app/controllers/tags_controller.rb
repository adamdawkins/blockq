class TagsController < ApplicationController
  respond_to :html

  #before_filter :find_user, :only => [:index]
  
  def index
     @tags = Tag.all.sort_by {|tag| tag.popularity}.reverse
   end
  
  def show 
    @tag = Tag.find(params[:id])
    respond_with(@tag)
  end
  
  private
  def find_user
    @user = User.find(params[:user_id])
  end
  
end
