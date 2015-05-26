class Result < ActiveRecord::Base
  belongs_to :question
  belongs_to :exam
  belongs_to :option
end
