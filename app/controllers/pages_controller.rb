class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :partners]

  def home
  end

  def partners
  end
end
