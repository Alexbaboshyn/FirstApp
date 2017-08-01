require 'rails_helper'

RSpec.describe Book, type: :model do
  # it { should validate_presence_of :name }
  #
  # it { should validate_presence_of :publisher }

  it { should belong_to(:user) }

  it { is_expected.to callback(:set_year).before(:validation) }  
end
