class Question < ActiveRecord::Base
  has_many :answers

  validates :question, :presence => true

  def self.daily_questions
    date = Date.today
    sum = Question.where(:created_at => date.beginning_of_day..date.end_of_day).count
  end

  def reset_best_answer
    self.answers.each do |answer|
      answer.best_answer = 0
    end
  end
end
