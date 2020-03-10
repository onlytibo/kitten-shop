class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items
  # attr_accessor :user


  # def initialize(user_id = User.last)
  #   super
  #   @user = user_id
  # end


end
