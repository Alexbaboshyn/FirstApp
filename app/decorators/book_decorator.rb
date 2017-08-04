class BookDecorator < Draper::Decorator
  delegate_all

  decorates_association :users
  def as_json *args

    if context[:index]

      {
        id: id,
        name: name,
        publisher: publisher,
        year: year
      }

    elsif context[:show]

      {
        user_id: user_id,
        name: name,
        publisher: publisher,
        year: year
      }
    end
  end
end
