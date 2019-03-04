class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :partner
  monetize :amount_cents

  def consume!
    self.update(consumed: true)
  end

end
