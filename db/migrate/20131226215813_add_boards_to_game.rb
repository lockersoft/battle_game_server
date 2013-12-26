class AddBoardsToGame < ActiveRecord::Migration
  def change
    add_column :games, :attack_board_id_1, :integer
    add_column :games, :defend_board_id_1, :integer
    add_column :games, :attack_board_id_2, :integer
    add_column :games, :defend_board_id_2, :integer
    add_column :games, :attack_board_id_3, :integer
    add_column :games, :defend_board_id_3, :integer
    add_column :games, :attack_board_id_4, :integer
    add_column :games, :defend_board_id_4, :integer
  end
end
