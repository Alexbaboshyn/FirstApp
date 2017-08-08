class Book < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  validates :publisher, presence: { message: 'must be given' }

  validates :year, numericality: true

  before_validation :set_year, on: :create

  def set_year
    self.year ||= Time.now.year
  end

end
