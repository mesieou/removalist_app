class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if current_user
      @kart = Kart.find_by(user_id: current_user.id)
    else
    @kart = Kart.create if @kart.nil?
    end

    if params[:search_input].present?
      @items = ListOfItem.search(params[:search_input])
    else
      @items = ListOfItem.limit(8)
    end
  end

  def create
    raise
  end
end
