class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :books, context: {brief: true}

  def as_json *args
    {
      id: id,
      name: name,
      books: books
    }
  end
end
