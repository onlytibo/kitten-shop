class ChargesController < ApplicationController
  def new
  end

def create
  # Amount in cents
  id = params[:user_id]
  @cart = Cart.where(user_id:id)
  @cart_items = CartItems.where(cart_id:@cart)
  @amount = Cart.total_cart(@cart)

  unless @cart_items.nil?
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
  else 
    @fail_order = "Ta commande est vide..."
    redirect_to root_path(:fail_new_order => @fail_order)
  end


end
