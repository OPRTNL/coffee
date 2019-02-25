class AddProductRefToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :product, foreign_key: true
  end
end
