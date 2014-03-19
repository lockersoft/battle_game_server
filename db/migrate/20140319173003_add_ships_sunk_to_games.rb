class AddShipsSunkToGames < ActiveRecord::Migration
  def change
    add_column :games, :computer_ships_sunk, :integer
    add_column :games, :user_ships_sunk, :integer
  end
end
