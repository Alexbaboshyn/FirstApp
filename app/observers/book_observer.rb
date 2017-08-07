class BookObserver < ActiveRecord::Observer
  include ::ActiveRecord::CommittedObserver

  def after_commit_on_create(book)
    BookJob.set(wait: 5.seconds).perform_later(book)
  end
end
