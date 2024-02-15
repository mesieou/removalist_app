class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def show
    @book
  end

  def new
    @location = Location.new
  end

  def create
  end
end
