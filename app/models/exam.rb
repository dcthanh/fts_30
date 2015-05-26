class Exam < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :subject
end
