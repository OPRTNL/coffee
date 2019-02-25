class RemoveTeddySkuFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :teddy_sku, :string
    add_column :orders, :quantity, :integer
  end
end
