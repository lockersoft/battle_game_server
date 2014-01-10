class UsersController < ApplicationController
  respond_to :json
  def index
    @users = User.all.order( :available )
  end

  def challenge
  end
end
