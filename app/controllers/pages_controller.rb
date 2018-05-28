class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #Assuming we want some of the spaces on the front page
    @spaces = Space.all
  end
end
