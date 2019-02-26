class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    @partners = Partner.all
  end

  def show
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

  def partner_params
    params.require(:partner).permit(:name, :adress, :picture_1, :picture_2, :picture_3)
  end
end