class User < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, presence: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
