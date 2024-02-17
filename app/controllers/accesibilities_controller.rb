class AccesibilitiesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  def new
    @location = Location.new(session[:pending_location])
  end

  def create
    @location = Location.new(session[:pending_location])
  end
end
