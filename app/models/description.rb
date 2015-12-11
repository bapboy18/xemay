class Description < ActiveRecord::Base
  belongs_to :review
  validate :review_id, presence: true
end
