class UsersController < ApplicationController

  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :photo, :photo_cache)
  end

end
