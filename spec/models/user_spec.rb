require 'rails_helper'

RSpec.describe User, type: :model do
  it { should be_an ApplicationRecord }

  it { should validate_presence_of :name }

  it { should have_many(:books) }

  it { should validate_presence_of :email }

  it { should validate_uniqueness_of(:email).case_insensitive }
end
