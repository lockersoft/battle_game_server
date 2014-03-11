class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :games
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/avatars/unknown.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  
  def avatar_url
    #"#{$custom_host}/#{avatar_image}"  # TODO: use this instead of avatar_name
    avatar.url(:thumb)
  end
  
  def self.get_profile( id )
    select(:id,:first_name,:last_name,:avatar_name,:level,:coins,:battles_won,:battles_lost,:battles_tied,:experience_points,:available,:online,:gaming,:email,:avatar_url).find(id)    
  end
 
  def self.display_available
    order( :available ).select( :id,:first_name,:last_name,:avatar_name,:level,:coins,:battles_won,:battles_lost,:battles_tied,:experience_points,:available,:online,:gaming,:email,:avatar_url )
    
  end
  
  def self.all_available
    where(available: true).where(online: true).where( gaming: false).all
  end
  
  def is_available_to_play?
    return available && online && !gaming
  end
  
  def display_status
    if is_available_to_play?
      "Available"
    elsif gaming
      "In a Game"
    else
      "Unavailable"
    end
    
  end
end
