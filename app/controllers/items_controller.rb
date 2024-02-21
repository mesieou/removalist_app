class ItemsController < ApplicationController
  def index
    @items = ListOfItems.all
  end
end
