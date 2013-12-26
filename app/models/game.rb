class Game < ActiveRecord::Base
  belongs_to :player1, :class_name => 'User', :foreign_key => 'player_id_1'
  belongs_to :player2, :class_name => 'User', :foreign_key => 'player_id_2'
  belongs_to :player3, :class_name => 'User', :foreign_key => 'player_id_3'
  belongs_to :player4, :class_name => 'User', :foreign_key => 'player_id_4'
  
  belongs_to :attack_board1, :class_name => 'Board', :foreign_key => 'attack_board_id_1'
  belongs_to :defend_board1, :class_name => 'Board', :foreign_key => 'defend_board_id_1'
  belongs_to :attack_board2, :class_name => 'Board', :foreign_key => 'attack_board_id_2'
  belongs_to :defend_board2, :class_name => 'Board', :foreign_key => 'defend_board_id_2'
  belongs_to :attack_board3, :class_name => 'Board', :foreign_key => 'attack_board_id_3'
  belongs_to :defend_board3, :class_name => 'Board', :foreign_key => 'defend_board_id_3'
  belongs_to :attack_board4, :class_name => 'Board', :foreign_key => 'attack_board_id_4'
  belongs_to :defend_board4, :class_name => 'Board', :foreign_key => 'defend_board_id_4'
  has_many :turns
  has_many :comments
end
