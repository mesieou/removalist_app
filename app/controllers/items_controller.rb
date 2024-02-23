class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    if params[:search_input].present?
      @items = ListOfItem.search(params[:search_input])
    else
      @items = ListOfItem.limit(8)
    end
  end
end
