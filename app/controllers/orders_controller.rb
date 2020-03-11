class OrdersController < ApplicationController

  def show

  end

  def new

  end

  def create
    @order = Order.new

    @user = current_user
    @cart = Cart.where(user_id: @user)

    @cart_items = CartItems.where(cart_id:@cart.id)

    

  end

end
