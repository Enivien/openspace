class ActivitiesController < ApplicationController
  def new
    @space = Space.find(params[:space_id])
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @space = Space.find(params[:space_id])
    @activity.space_id = @space

    if @activity.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:offsite_meeting, :workshop, :photo_shoot, :film_shoot, :corporate_event, :office_party, :product_launch)
  end
end
