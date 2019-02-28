class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @partners = Partner.all
    @markers = @partners.map do |partner|
      {
        lng: partner.longitude,
        lat: partner.latitude
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
  end

  def update
    @partner.update!
    redirect_to partner_path(@partner)
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
