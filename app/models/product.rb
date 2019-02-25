class Product < ApplicationRecord
  belongs_to :partner
  has_many :orders
  monetize :price_cents
end
