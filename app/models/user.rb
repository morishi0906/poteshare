class User < ApplicationRecord
  has_secure_password
  mount_uploader :user_img, ImageUploader
  has_many :rooms
  validates :mail,:name,:password_digest, presence: true , on: :create
  validates :name, presence: true , on: :profileupdate
  validates :id, :mail, :password_digest , presence: true , on: :update
  validates :mail, uniqueness: true, on: :create
  validates :password_digest, length: { in: 6..12 } , on: :create
  validates :name, length: { in: 1..12 } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true
end
