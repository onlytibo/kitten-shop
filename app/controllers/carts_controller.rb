class CartsController < ApplicationController
  def show
    id = params[:id]
    @quantity = CartItems.set_quantity_items_in_cart(id)

    @cart_items = CartItems.where(cart_id: id).sort.uniq { |c| c.item_id }
    @total = Cart.total_cart(id)

    if @cart_items.nil?
      @empty = true
    else
      @empty = false
    end

  end

  def create
  end

  def update
  end

  def destroy

  end
end
