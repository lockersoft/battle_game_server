class UsersController < ApplicationController
  def index
    @users = User.all.order( :available )
  end

  def challenge
  end
end
