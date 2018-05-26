class AmenitiesController < ApplicationController
  def new
    @space = Space.find(params[:space_id])
    @amenity = Amenity.new
  end

  def create
    @amenity = Amenity.new(amenity_params)
    @space = Space.find(params[:space_id])
    @amenity.space = @space

    if @amenity.save
      redirect_to new_space_activity_path(@space)
    else
      render :new
    end
  end

  private

  def amenity_params
    params.require(:amenity).permit(:on_site_parking, :wheelchair_access, :airco, :elevator, :natural_light, :whiteboard, :kitchen, :projector, :wifi)
  end
end
