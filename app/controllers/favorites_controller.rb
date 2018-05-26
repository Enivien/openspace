class FavoritesController < ApplicationController

  before_action :set_favorite, only: [:show, :destroy]

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    # Will wait until we have the structure of where we want this.
    # Is written different I believe because button on card, etc.
    @space = Space.find(params[:space_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.space = @space

    if @favorite.save
      redirect_to spaces_path
    end
  end

  def destroy
    @space = Space.find(params[:space_id])
    @favorite.destroy

    redirect_to spaces_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :space_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
