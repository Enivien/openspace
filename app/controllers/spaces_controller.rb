class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :destroy, :edit, :update]

  def index
    if query = params[:query]
      sql = query.permit!.to_hash.map do |key, value|
        next if value == 'nil' || value == ''
        if ['activities', 'amenities'].include?(key)
          "#{value} = 'true'"
        elsif ['price_per_hour', 'capacity'].include?(key)
          "#{key} >= '#{value}'"
        else
          "#{key} = '#{value}'"
        end
      end.compact
      sql = sql.join(" AND ")
      @spaces = Space.joins(:amenity).joins(:activity).where(sql)
    else
      @spaces = Space.all
    end
    @spaces_markers = @spaces.where.not(latitude: nil, longitude: nil)
    @markers = @spaces_markers.map do |space|
      content = space.name

      {
        lat: space.latitude,
        lng: space.longitude,
        # infoWindow: { content: content }#,
        infoWindow: { content: render_to_string(partial: "/spaces/map_box", locals: { space: space }) }
      }
    end

    @favorite = Favorite.new
    @amenities = ["on_site_parking", "wheelchair_access", "airco", "elevator", "natural_light", "whiteboard", "kitchen", "projector", "wifi"]
    @activities = ["offsite_meeting", "workshop", "photo_shoot", "film_shoot", "corporate_event", "office_party", "product_launch"]
  end

  def show
    @booking = Booking.new
    @activities = @space.activities

    @spaces = Space.all
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)

    @space.user = current_user
    @space.save
    if @space.save
      redirect_to new_space_amenity_path(@space)
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
    params.require(:space).permit(:name, :capacity, :size, :restroom, :description, :room, :price_per_hour, :location, :user_id, pictures: [])
  end

  def set_space
    @space = Space.find(params[:id])
  end
end
