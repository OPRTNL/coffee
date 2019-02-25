class OrdersController < ApplicationController

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    product = Product.find(params[:teddy_id])
    order   = Order.create!(product: product, amount: product.price, state: 'pending', user: current_user)

    redirect_to new_order_payment_path(order)
  end
end
