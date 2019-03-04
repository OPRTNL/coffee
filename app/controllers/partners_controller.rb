class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:city].present?
      @partners = Partner.near(params[:city], 15)
    elsif params[:lat].present?
      @partners = Partner.near([params[:lat],params[:long]], 15)
    else
      @partners = Partner.all
    end
    set_markers
    set_orders_status
    end
  end

  def show
    @marker = {
        lng: @partner.longitude,
        lat: @partner.latitude
      }
    @products = Product.where(partner: @partner)
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    @product = Product.new(name: "café suspendu", price_cents: 150)
    @partner.user = current_user
    @partner.save!
    @product.partner = @partner
    @product.save!
    redirect_to partner_path(@partner)
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def update
    if @partner.update!(partner_params)
      redirect_to partner_path(@partner)
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy
    redirect_to partners_path
  end

private

  def set_markers
    @markers = @partners.map do |partner|
      {
        lng: partner.longitude,
        lat: partner.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { partner: partner }),
      }
  end

  def set_orders_status
    @orders_pending = @partner.orders.where(:consumed == false).count
    @orders_total = @partner.orders.all.count
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def partner_params
    params.require(:partner).permit(:name, :address, :photo, :photo_cache)
  end
end
