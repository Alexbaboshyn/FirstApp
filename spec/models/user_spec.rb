require 'rails_helper'

RSpec.describe User, type: :model do
  it { should be_an ApplicationRecord }

  it { should validate_presence_of :name }

  it { should have_many(:books) }
end
