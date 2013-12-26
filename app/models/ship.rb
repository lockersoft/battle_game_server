class Ship < ActiveRecord::Base
  # Directions start at "NOON" for 0,
  # 0 => North
  # 1 => North East
  # 2 => East
  # 3 => South East
  # 4 => South
  # 5 => South West
  # 6 => West
  # 7 => North West
  
  belongs_to :board
  after_create :position_ship
  
  def position_ship
    self.board.position_ship( self )
  end
end
