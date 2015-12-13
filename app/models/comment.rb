class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validates :user, presence: true
  validates :review, presence: true
  validate :content, on: :create
end
