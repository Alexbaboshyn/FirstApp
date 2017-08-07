class UserObserver < ActiveRecord::Observer
  include ::ActiveRecord::CommittedObserver
  
  def after_commit_on_create(user)
    UserMailer.welcome(user).deliver_later
  end
end
