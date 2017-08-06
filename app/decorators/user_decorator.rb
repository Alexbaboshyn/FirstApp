class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :books, context: {brief: true}

  def as_json *args
    {
      id: id,
      name: name,
      email: email,
      books_quantity: books_quantity,
      books: books
    }
  end
end
