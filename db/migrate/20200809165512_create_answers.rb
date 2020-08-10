class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :response
      t.integer :question_id

      t.timestamps
    end
  end
end
