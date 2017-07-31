class UsersController < ApplicationController

  def create
   @user = User.new resource_params

   resource.save!
  end

  private
  def resource
    @user ||= User.find(params[:id])
  end

  def collection
    @users ||= User.all
  end

  def resource_params
    params.permit(:name)
    #  params.require(:user).permit(:name)
  end

end
