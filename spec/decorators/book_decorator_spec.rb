require 'rails_helper'

RSpec.describe BookDecorator do
  let(:book) { stub_model Book, user_id: 1, id: 1, name: 'Book', publisher: 'someone', year: 2017 }

  describe '#as_json' do
    context '#brief' do
      subject { book.decorate(context: { brief: true }) }

      its('as_json.symbolize_keys') do

        should eq \
        id: 1,
        name: 'Book',
        publisher: 'someone',
        year: 2017
      end
    end

    context do
      subject { book.decorate }

      its('as_json.symbolize_keys') do

        should eq \
        user_id: 1,
        id: 1,
        name: 'Book',
        publisher: 'someone',
        year: 2017
      end
    end
  end
end
