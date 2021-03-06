require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it { should be_an ApplicationController }

  describe '#create' do
    let(:params) { { user_id: '1', book: { name: 'test', publisher: 'test', year: '2017' } } }

    let(:parent) { stub_model User }

    let(:object) { stub_model Book}

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:build).with(permit!(name: 'test', publisher: 'test', year: '2017')).and_return(object) }
      end
    end

    before { expect(object).to receive(:save!) }

    before { post :create, params: params, format: :json }

    it { should render_template :create }
  end

  describe '#collection' do
    let(:params) { { user_id: '1' } }

    let(:parent) { stub_model User }

    before { expect(subject).to receive(:params).and_return(params) }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before { expect(parent).to receive(:books).and_return(:collection) }

    its(:collection) { should eq :collection }
  end
end
