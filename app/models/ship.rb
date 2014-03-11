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
  
  def sink
    self.sunk = true
  end
  
  def to_s
    "Name: #{self.name} size: #{self.size}, start_row: #{self.start_row}, start_col: #{self.start_col}"  
  end
  
  def position_ship
    self.board.position_ship( self )
  end
end
