class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :answer, :string
      t.column :author, :string
      t.column :question_id, :integer

      t.timestamps null: false
    end
  end
end
