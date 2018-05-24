class FavoritesController < ApplicationController

  before_action :set_spaceship, only: [:show, :destroy]

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def create
    # Will wait until we have the structure of where we want this.
    # Is written different I believe because button on card, etc.
  end

  def destroy

  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :space_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
