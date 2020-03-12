module UsersHelper

  def create_cart_and_assign_to_current_user
    cart = Cart.create(user: User.last)
  end
end
