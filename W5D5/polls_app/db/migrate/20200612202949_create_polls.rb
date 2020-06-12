class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.string :author, null: false, unique: true
      t.integer :author_id, null: false, unique: true

      t.timestamps
    end
  end
end