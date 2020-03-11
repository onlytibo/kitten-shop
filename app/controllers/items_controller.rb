class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    id = params[:id]
    @item = Item.find(id)
  end

  

end
