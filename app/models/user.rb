class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :games
  
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
