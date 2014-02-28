class UsersController < ApplicationController
  before_filter :check_auth, :except => [:index]
  respond_to :json, :xml, :html #, :except => :login

  def login
    if current_user
      respond_with User.get_profile(current_user.id)
    else
      render json: '"not authorized"'  # Probably never called as the server will reject bad passwords, etc. at a lower level
    end
  end
  
  def index
    @users = User.display_available
    @users = User.all_available if params[:available]
    respond_with @users
  end
    
end
