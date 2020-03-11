class OrdersController < ApplicationController

  def show

  end

  def new

  end

  def create
    # on créer une order
    @order = Order.new(user:current_user)
    @cart = Cart.where(user_id: current_user.id)


    id = params[:user_id]

    charge_error = nil

    # on copie les items du cart dans l'order item
    @cart_items = CartItems.where(cart_id:@cart)

    @cart_items.each do |c|
      @order_item = OrderItem.create(order:@order,item:c.item)
    end

    @amount = Cart.where(user_id:id)
    @total = params[:amount]
    puts "================================================="
    puts "================================================="
    puts "================================================="
    puts @amount
    puts @total
    puts params
    puts "================================================="
    puts "================================================="
    puts "================================================="

    unless @order_item.nil?
      if @order.valid?
        begin
          customer = Stripe::Customer.create({
          email: params[:stripeEmail],
          source: params[:stripeToken],
        })

        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount,
          description: 'Rails Stripe customer',
          currency: 'eur',
        })

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to user_cart_path(current_user)
      end

        if charge_error
          flash[:error] = charge_error
          render :new
        else
          @order.save
          flash[:confirm_order] = "Merci ta commande a bien été prise en compte"
          @confirm_order = "Merci ta commande a bien été prise en compte"
          redirect_to root_path(:new_order => @confirm_order)
        end
      else
        flash[:error] = 'one or more errors in your order'
        render :new
      end
    else
      @fail_order = "Ta commande est vide..."
      redirect_to root_path(:fail_new_order => @fail_order)
    end
    























    # # on copie les items du cart dans l'order item
    # @cart_items = CartItems.where(cart_id:@cart)

    # @cart_items.each do |c|
    #   @order_item = OrderItem.new(order:@order,item:c.item)
    #   if @order_item.save
    #     puts "O-K"
    #   else
    #     puts @order_item.errors.full_messages
    #   end
    # end

    # unless @order_item.nil?
    #   if @order.save
    #     puts "ORDER CREATED"
    #     flash[:confirm_order] = "Merci ta commande a bien été prise en compte"
    #     @confirm_order = "Merci ta commande a bien été prise en compte"
    #     redirect_to root_path(:new_order => @confirm_order)
    #   else
    #     @fail_order = "Ta commande est vide..."
    #     puts @order.errors.full_messages
    #     redirect_to root_path(:fail_new_order => @fail_order)
    #   end
    # else
    #     @fail_order = "Ta commande est vide..."
    #     redirect_to root_path(:fail_new_order => @fail_order)
    # end

  end

end
