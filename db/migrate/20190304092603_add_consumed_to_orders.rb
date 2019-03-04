class AddConsumedToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :consumed, :boolean, :default => false
  end
end
