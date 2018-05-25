class SpacesController < ApplicationController

  before_action :set_space, only: [:show, :destroy, :edit, :update]

  def index
    @spaces = Space.all

    @spaces_markers = Space.where.not(latitude: nil, longitude: nil)

    @markers = @spaces_markers.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end
  end

  def show
    @space = Space.new
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)

    @space.user = current_user
    @space.save
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @space.update(space_params)

    redirect_to space_path(@space)
  end

  def destroy
    @space.destroy
    authorize @space
    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :capacity, :size, :restroom, :description, :room, :price_per_hour, :location, :picture, :picture_cache, :user_id)
  end

  def set_space
    @space = Space.find(params[:id])
  end
end
