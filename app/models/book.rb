class Book < ApplicationRecord
  # attr_accessor :year
  validates :name, presence: { message: "can't be blank" }

  validates :publisher, presence: { message: "must be given" }

  validates :year, numericality: true


  belongs_to :user

  before_validation :set_year

  def set_year
    self.year ||= Time.now.year
  end

end
