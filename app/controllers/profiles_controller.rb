class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: []
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    @user.update(params[:user])
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :avatar_cache, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
