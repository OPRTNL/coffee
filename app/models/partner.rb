class Partner < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  validates :name, presence: true
  validates :address, presence: true
  has_many :products
  has_many :orders, through: :products
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
end
