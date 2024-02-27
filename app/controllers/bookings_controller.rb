class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :available]
  def index
  end
  def available

  end
end
