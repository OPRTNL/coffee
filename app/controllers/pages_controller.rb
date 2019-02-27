class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :partner]

  def home
  end

  def partner
  end
end
