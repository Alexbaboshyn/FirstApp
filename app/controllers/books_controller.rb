class BooksController < ApplicationController

  def create
   @book = parent.books.build resource_params

   resource.save!
  end

  private
  def parent
    @parent ||= User.find(params[:user_id])
  end

  def resource
    @book ||= Book.find(params[:id])
  end

  def collection
    @books ||= Book.all
  end

  def resource_params
    params.require(:book).permit(:name, :publisher, :year)
  end

end
