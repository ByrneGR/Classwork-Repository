class CreateAnswerChoice < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_choices do |t|
      t.string :answer, null: true
      
      t.timestamps
    end
  end
end