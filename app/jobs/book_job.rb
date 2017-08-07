class BookJob < ActiveJob::Base
  queue_as :default

  def perform(id)
    @book = Book.find id
    @book.user.increment!(:books_quantity)
  end
end
