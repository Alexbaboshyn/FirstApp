require 'rails_helper'

RSpec.describe BookObserver, type: :observer do
  let(:book) { stub_model Book }

  subject { described_class.send(:new) }

  describe '#after_commit_on_create' do
    before do
      expect(BookJob).to receive(:set).with(wait: 5.seconds) do
        double.tap { |a| expect(a).to receive(:perform_later).with(book) }
      end
    end

    it { expect { subject.after_commit_on_create(book) }.to_not raise_error }
  end
end
