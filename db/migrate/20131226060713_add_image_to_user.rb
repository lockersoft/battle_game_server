class AddImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar_image, :string, :default => "avatars/unknown.jpg"
  end
end
