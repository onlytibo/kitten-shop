class PhotosController < ApplicationController
  def create
      @item = Item.find(params[:item_id])
      @item.photo.attach(params[:photo])
      redirect_to(item_path(@item))
  end
end
