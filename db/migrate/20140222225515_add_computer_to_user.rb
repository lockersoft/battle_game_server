class AddComputerToUser < ActiveRecord::Migration
  def change
    add_column :users, :computer, :boolean, :default => false
  end
end
