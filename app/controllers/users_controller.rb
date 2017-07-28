class UsersController < ApplicationController


  def index
  end

  def show
  end

  def create
   @user = User.new resource_params

   resource.save!
  end

  def update
    resource.update! resource_params
  end

  def destroy
    resource.destroy!
  end

 private
   def resource
     @user ||= User.find(params[:id])
   end

   def collection
     @users ||= User.all
   end

   def resource_params
    #  params.require(:user).permit(:name)
     params.permit(:name)
   end

end
