class ChangeBestAnswerToBoolean < ActiveRecord::Migration
  def change
    remove_column :answers, :best_answer, :integer
    add_column :answers, :best_answer, :boolean, default: false
  end
end
