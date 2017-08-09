class UsersController < ApplicationController
  def build_resource
   @user = User.new resource_params
  end

  private
  def resource
    @user ||= User.find(params[:id])
  end

  def collection
    @users ||= User.all
  end

  def resource_params
    params.require(:user).permit(:name, :email)
  end

end
