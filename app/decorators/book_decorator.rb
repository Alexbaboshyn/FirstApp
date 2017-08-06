class BookDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    if context[:brief]
      {
        id: id,
        name: name,
        publisher: publisher,
        year: year
      }
    else
      {
        user_id: user_id,
        id: id,
        name: name,
        publisher: publisher,
        year: year
      }
    end
  end
end
