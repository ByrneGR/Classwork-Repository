class EditLikes < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :artwork_id, :likeable_id 
    rename_column :likes, :comment_id, :likeable_type
    change_column :likes, :likeable_type, :string
    remove_index :likes, :likeable_id
    remove_index :likes, :likeable_type
    add_index :likes, [:likeable_id, :likeable_type]
  end
end
