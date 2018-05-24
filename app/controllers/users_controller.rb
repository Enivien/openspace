class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only:
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    # Give options to edit profile on user profile page. Find a place to edit email / password.
    @user.update(params[:user])
    redirect_to user_path(user)
  end

  def destroy
    # Destroy user spaces, bookings, messages on account delete
    @user.destroy
    redirect_to root_path

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :avatar_cache, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
