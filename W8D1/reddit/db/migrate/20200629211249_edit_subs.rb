class EditSubs < ActiveRecord::Migration[5.2]
  def change
    rename_column :subs, :description, :details
  end
end
