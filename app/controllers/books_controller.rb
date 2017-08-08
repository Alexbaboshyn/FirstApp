class BooksController < ApplicationController
  def build_resource
   @book = parent.books.build resource_params
  end

  private
  def parent
    @parent ||= User.find(params[:user_id])
  end

  def resource
    @book ||= Book.find(params[:id])
  end

  def collection
    @books ||= parent.books
  end

  def resource_params
    params.require(:book).permit(:name, :publisher, :year)
  end

end
