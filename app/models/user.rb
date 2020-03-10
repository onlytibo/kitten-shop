class User < ApplicationRecord
  include UsersHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :cart
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send
  after_create :create_cart_and_assign_to_current_user


  # attr_accessor :cart
  
  # def initialize(cart_id = Cart.create.id)
  #   super
  #   @cart = cart_id
  # end


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
