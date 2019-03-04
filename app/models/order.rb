class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  monetize :amount_cents

  def consume!
    ap "je suis la"
    ap self
    self.update!(consumed: true)
  end

end
