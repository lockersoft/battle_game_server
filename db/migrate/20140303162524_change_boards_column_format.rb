class ChangeBoardsColumnFormat < ActiveRecord::Migration
  def change
    change_column :boards, :cells, :text
  end
end
