class UsersController < ApplicationController
  before_filter :check_auth, :except => [:index]
  respond_to :json, :xml, :html #, :except => :login
  require 'gcm'

  def logout
    if current_user
      current_user.available = false
      current_user.online = false
      current_user.gaming = false
      current_user.save!
    end
    sign_out current_user 
    render json: { status: 'logged out' }
  end

  def login
    gcm_token = params[:gcm]
    if current_user
      current_user.gcm_token = gcm_token if ! gcm_token.nil?
      logger.info "gcm_token: " + gcm_token
      current_user.available = true
      current_user.save!
      respond_with User.get_profile(current_user.id)
    else
      render json: { status: 'not authorized' }  # Probably never called as the server will reject bad passwords, etc. at a lower level
    end
  end
  
  def index
    @users = User.display_available
    @users = User.all_available if params[:available]
    respond_with @users
  end
  
  def challenge
    other_user = User.find(params[:other_user_id])
    
  end
  
  def test_gcm
    # Send a message to the user's gcm_token through the GCM Service.
    gcm = GCM.new('AIzaSyDZ_a_SnkbWPp3BaS_ggGUIlIAa_nYxRlk')
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
    #  gcm = GCM.new(api_key, timeout: 3)
    
    registration_ids = [current_user.gcm_token] # an array of one or more client registration IDs
    options = {message: 'Test GCM Calling', gcm_token: current_user.gcm_token}
    response = gcm.send_notification(registration_ids, options)
    logger.info 'GCM response: ' + response.inspect
    response = JSON.parse(response[:body])
    render json: {response: response}  # Probably never called as the server will reject bad passwords, etc. at a lower level
    #render :text => response
  end
    
end
