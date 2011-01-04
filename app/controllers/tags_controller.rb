class TagsController < ApplicationController
  respond_to :html
  
  def show 
    @tag = Tag.find(params[:id])
    respond_with(@tag)
  end
end
