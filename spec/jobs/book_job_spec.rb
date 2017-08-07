require 'rails_helper'

RSpec.describe BookJob, type: :job do
  its(:queue_name) { should eq 'default' }

  describe '#perform' do
    let(:book) { stub_model Book }

    before { expect(Book).to receive(:find).with(5).and_return(book) }

    before do
      #
      # @book.user.increment!(:books_quantity)
      #
      expect(book).to receive(:user) do
        double.tap { |a| expect(a).to receive(:increment!).with(:books_quantity) }
      end
    end

    it { expect { subject.perform(5) }.to_not raise_error }
  end
end
