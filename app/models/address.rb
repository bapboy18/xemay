class Address < ActiveRecord::Base
  belongs_to :review
  belongs_to :region
  validate :review_id

  delegate :name, :phone_number, :content, to: :review, prefix: true
end
