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
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to available_path, notice: 'Items were successfully added to your kart.'}
        format.json
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json
      end
    end
  end

  end
  def item_params
    params.require(:item).permit(:name, :estimated_total_loading_time, :kart_id)
  end
end
