class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :cells
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
