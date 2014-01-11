class UsersController < ApplicationController
  respond_to :json, :xml, :html
  def index
    @users = User.all.order( :available )
    respond_with @users
  end

  def challenge
  end
end
