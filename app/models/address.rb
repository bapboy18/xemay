class Address < ActiveRecord::Base
  belongs_to :review
  validates :review, presence: true
end
