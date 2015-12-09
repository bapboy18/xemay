class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  validate :user_id, presence: true
  validate :comment_id, presence: true
  validate :content, presence: true, length: { maximum: 10000 }
end
