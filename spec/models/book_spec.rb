require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should be_an ApplicationRecord }

  it { should belong_to(:user) }

  it { should validate_presence_of :name }

  it { should validate_presence_of(:publisher).with_message('must be given') }

  it { should validate_numericality_of(:year) }

  it { is_expected.to callback(:set_year).before(:validation).on(:create) }


  describe '#set_year' do
    context do
      let(:subject) { stub_model Book, year: 2010 }

      before { subject.send :set_year }

      its(:year) { should eq 2010 }
    end

    context do
      before do
       #
       # Time.now.year -> 2017
       #
         expect(Time).to receive(:now) do
           double.tap { |a| expect(a).to receive(:year).and_return(2017) }
         end
       end

       before { subject.send :set_year }

       its(:year) { should eq 2017 }
     end
   end
end
