class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player_id_1
      t.integer :player_id_2
      t.integer :player_id_3
      t.integer :player_id_4
      t.time :game_time
      t.integer :winner_id
      t.integer :coins

      t.timestamps
    end
  end
end
