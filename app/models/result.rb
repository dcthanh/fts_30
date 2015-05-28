class Result < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  belongs_to :option

  scope :correct_answer, -> {where(correct: true)}
end
