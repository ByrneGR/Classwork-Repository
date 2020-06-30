class Addcolumns < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :artist_favorite, :boolean
    add_column :artwork_shares, :shared_favorite, :boolean
  end
end
