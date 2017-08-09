require 'rails_helper'

RSpec.describe UserObserver, type: :observer do
  let(:user) { stub_model User }

  subject { described_class.send(:new) }

  describe '#after_commit_on_create' do
    before do
      expect(UserMailer).to receive(:welcome).with(user) do
        double.tap { |a| expect(a).to receive(:deliver_later) }
      end
    end

    it { expect { subject.after_commit_on_create(user) }.to_not raise_error }
  end
end
