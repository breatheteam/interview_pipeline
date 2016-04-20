class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
