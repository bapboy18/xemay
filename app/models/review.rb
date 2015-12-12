class Review < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :descriptions, dependent: :destroy
  has_many :addresses, dependent: :destroy
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 10000 }

  accepts_nested_attributes_for :descriptions, reject_if: :all_blank
  accepts_nested_attributes_for :addresses, reject_if: :all_blank
end
