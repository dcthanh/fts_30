class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  load_and_authorize_resource param_method: :user_params

  def destroy
    user = User.find params[:id]
    user.destroy
    flash[:success] = t :success_flash
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end