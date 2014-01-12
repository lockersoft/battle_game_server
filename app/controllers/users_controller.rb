class UsersController < ApplicationController
  respond_to :json, :xml, :html
  def index
    @users = User.order( :available )
    @users = User.is_available? if params[:available]
    respond_with @users
  end
  
  def challenge
  end
end
