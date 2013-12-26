class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.string :name
      t.integer :size
      t.integer :start_row
      t.integer :start_col
      t.integer :direction
      t.string :image
      t.references :board

      t.timestamps
    end
  end
end
