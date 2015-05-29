class Question < ActiveRecord::Base
  has_many :options, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :exam  

  accepts_nested_attributes_for :options, reject_if: ->(a){a[:content].blank?}, allow_destroy: true

  def reject_options(attributes)
    attributes[:content].blank?
  end

end
