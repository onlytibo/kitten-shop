class OrdersController < ApplicationController

  def show

  end

  def new

  end

  def create
    # on créer une order
    @order = Order.new(user:current_user)
    @cart = Cart.where(user_id: current_user.id)
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts @cart

    # on copie les items du cart dans l'order item
    @cart_items = CartItems.where(cart_id:@cart)
    
    @cart_items.each do |c|
      @order_item = OrderItem.new(order:@order,item:c.item)
      if @order_item.save
        puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOKKKKKKKKKKKKKKKKKKKKKKKKKKK"
      else
        puts @order_item.errors.full_messages
      end
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts @order_item.inspect
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    end

    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts @order.inspect
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"


  end

end
