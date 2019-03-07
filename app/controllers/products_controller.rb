class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def generate_order
    product = Product.find(params[:id])
    order   = Order.create!(product: product, amount: product.price, state: 'pending', user: current_user)
    redirect_to new_order_payment_path(order)
  end
end
