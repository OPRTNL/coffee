class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    if params[:city].present?
      @partners = Partner.near(params[:city], 15)
    else
      @partners = Partner.all
    end

    @markers = @partners.map do |partner|
      {
        lng: partner.longitude,
        lat: partner.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { partner: partner }),
      }
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
    @partner.user = current_user
    @partner.save!
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
