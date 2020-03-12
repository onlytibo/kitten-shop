class OrdersController < ApplicationController

  def show

  end

  def new

  end

  def create
    # on créer une order
    @order = Order.new(user:current_user)
    @cart = Cart.find_by(user_id: current_user.id)
    id = params[:user_id]

    charge_error = nil

    @cart_items = CartItems.where(cart_id:@cart)

    @cart_items.each do |c|
      @order_item = OrderItem.create(order:@order,item:c.item)
    end
    @order_items = OrderItem.where(order_id:@order)
    
    @cart = Cart.where(user_id:id)
    @amount = @order.total_amount_order(@cart_items)
    @amount = @amount.to_i
    
    puts "================================================="
    puts "================================================="
    puts "================================================="
    print @amount
    puts "€"
    puts "================================================="
    puts "================================================="
    puts "================================================="


    unless @order_item.nil?
      if @order.save
        @cart_items.destroy_all
        puts "ORDER CREATED"
        flash[:confirm_order] = "Merci ta commande a bien été prise en compte"
        @confirm_order = "Merci ta commande a bien été prise en compte"
        redirect_to root_path(:new_order => @confirm_order)
      else
        @fail_order = "Ta commande est vide..."
        puts @order.errors.full_messages
        redirect_to root_path(:fail_new_order => @fail_order)
      end
    else
        @fail_order = "Ta commande est vide..."
        redirect_to root_path(:fail_new_order => @fail_order)
    end

  end

end
