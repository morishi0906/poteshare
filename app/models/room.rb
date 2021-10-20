class Room < ApplicationRecord
  mount_uploader :room_img, ImageUploader
  belongs_to :user
  has_many :lents
  validates :room_name, :address, :price, :room_img, :room_message, presence: true
  validates :room_message, length: { maximum: 170 } 
end
