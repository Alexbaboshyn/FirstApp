require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { stub_model User, email: 'test@test.com' }

  subject { UserMailer.welcome user }

  its(:from) { should eq ['from@example.com'] }

  its(:to) { should eq ['test@test.com'] }

  its(:subject) { should eq 'Welcome!' }
end
