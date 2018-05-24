class SpacesController < ApplicationController
  def index
    @spaces = Space.all
  end

  def show
  end

  def new
  end
end
