class OrdersController < ApplicationController

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def create
    product = Product.find(params[:product_id])
    order   = Order.create!(product: product, amount: product.price, state: 'pending', user: current_user)
    redirect_to new_order_payment_path(order)
  end

  # PATCH /orders/:id/consume
  def consume
    @order = Order.find(params[:id])
    if @order.consume!
      ActionCable.server.broadcast(
        "partner_counter_#{@order.product.partner.id}",
        toto: @order.product.partner.orders.where(consumed: false).count
      )
      redirect_to edit_partner_path(@order.product.partner)
    end
  end

  def update
  end
end
