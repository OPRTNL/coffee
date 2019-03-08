class OrdersController < ApplicationController

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  # PATCH /orders/:id/consume
  def consume
    @order = Order.find(params[:id])
    if @order.consume!

      ActionCable.server.broadcast(
        "partner_counter_#{@order.product.partner.id}",
        toto: @order.product.partner.orders.where(consumed: false, state: 'paid').count
      )
      UserMailer.thank_you(@order.user).deliver_now
      @partner = @order.product.partner
      @order = @partner.orders.where(consumed: false, state: 'paid').first
    end

  end

  def update
  end
end
