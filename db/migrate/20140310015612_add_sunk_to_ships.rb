class AddSunkToShips < ActiveRecord::Migration
  def change
    add_column :ships, :sunk, :boolean, :default => false
  end
end
