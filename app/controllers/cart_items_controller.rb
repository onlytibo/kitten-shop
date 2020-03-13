class CartItemsController < ApplicationController
  before_create :authenticate_user!

  def index
    
  end

  def create
    @cart = current_user.cart
    @item = Item.find_by(id:params[:id])
    @cart_item = CartItems.new(cart_id:@cart.id,item_id:@item.id)
    

    if @cart_item.save
      redirect_to user_cart_path(:user_id => current_user.id, :id => @cart.id)
    else
      puts @cart_item.errors.full_messages
      redirect_to root_path
    end

  end

  def update
  end

  def destroy
    @cart = current_user.cart
    @item = Item.find_by(id:params[:id])
    @cart_item = CartItems.find_by(item_id:@item.id)
    @cart_item.destroy
    redirect_to user_cart_path(:user_id => current_user.id, :id => @cart.id)
  end
end
