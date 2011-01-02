class SeshController < ApplicationController
  respond_to :html
   def new 
     @sesh = Sesh.new
   end

   def create
     @sesh = params[:sesh]
     user = User.find_by_username(@sesh.username)
     if user.present?
       cookies.permanent[:user] = user.id
     end
     respond_with(@sesh)

   end
end
