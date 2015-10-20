class Answer < ActiveRecord::Base
  belongs_to :question
  validates :answer, :presence => true

  def self.daily_answers
    date = Date.today
    sum = Answer.where(:created_at => date.beginning_of_day..date.end_of_day).count
  end
end
