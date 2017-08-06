require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { stub_model User, id: 1, name: 'Bob' }

  subject { user.decorate }

  describe '#as_json' do
    its('as_json.symbolize_keys') do

      should eq \
        id: 1,
        name: 'Bob',
        books: user.books.decorate
      end
    end
  end
