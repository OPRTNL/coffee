class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy, :counter]
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]
  layout "no_navigation", only: [:counter]

  def index

    @partners = Partner.all.includes(:products)

    if params[:city].present?
      @partners = @partners.near(params[:city], 15)
      cookies.permanent[:city] = params[:city]
    elsif params[:lat].present?
      @partners = @partners.near([params[:lat], params[:long]], 15)
    elsif cookies[:city].present?
      @partners = @partners.near(cookies[:city], 15)
    else
      @partners
    end
    set_markers
    # set_orders_status
  end

  def counter
    set_partner
    set_orders_status
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
    @product = Product.new(name: "café suspendu", price_cents: 200)
    @partner.user = current_user
    if @partner.save
      @product.partner = @partner
      @product.save
      redirect_to edit_partner_path(@partner)
    else

      render :new
    end
  end

  def edit
    if @partner.user == current_user
      set_orders_status
      @order = @partner.orders.where(consumed: false, state: "paid").first
    else
      redirect_to partners_path, :flash => { error: "You cant access this coffe" }
    end
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
        partnerId: partner.id,
      }
    end
  end

  def set_partner
    @partner = Partner.find(params[:id])
  end

  def set_orders_status
    @orders_pending = @partner.orders.where(consumed: false, state: "paid").count
    @orders_total = @partner.orders.all.count
  end

  def set_user
    @user = current_user
  end

  def partner_params
    params.require(:partner).permit(:name, :address, :photo, :photo_cache)
  end
end
