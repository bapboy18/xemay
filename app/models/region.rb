class Region < ActiveRecord::Base
  has_many :addresses
  has_many :towns, class_name: Region.name, foreign_key: :province_id
  belongs_to :province, class_name: Region.name
end
