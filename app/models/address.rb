class Address < ActiveRecord::Base
  belongs_to :review
  belongs_to :region
  validate :review_id
end
