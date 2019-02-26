class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
    @partner  = Partner.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update

  end

  def destroy
  end

end
