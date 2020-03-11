class UsersController < ApplicationController
  before_action :is_current_user?, only: [:show]
  before_action :authenticate_user!

  def index
    redirect_to root_path
  end

  def show
    @user = User.find_by(id:params[:id])
    # @user = set_current_user

    if current_user == @user
      @user = User.find_by(id:params[:id])
    else
      redirect_to root_path
    end
  end

  def create
    @user.avatar.attach(params[:avatar])
  end



def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
end


  private

  def set_current_user
    @user = User.find(params[:id])
  end

  def set_current_id
    @id = params['id']
  end

  def is_current_user?
    unless current_user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :avatar)
  end

end
