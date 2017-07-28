require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#index' do
    before { process :index, method: :get, format: :json }

    it { should render_template :index }
  end

  # describe '#show' do
  #   before { process :show, method: :get, format: :json }
  #
  #   it { should render_template :show }
  # end


  describe '#create' do
    let(:params) {{ name: 'Bob' }}

    let(:user) { stub_model User }

    before { expect(User).to receive(:new).with(permit! params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end


  describe '#collection' do
      before { expect(User).to receive(:all).and_return(:collection) }

      its(:collection) { should eq :collection }
  end


  describe '#resource' do
      let(:params) {{id: 1 }}

      before { expect(subject).to receive(:params).and_return(params)}

      before { expect(User).to receive(:find).with(1).and_return(:resource) }

      its(:resource) { should eq :resource }
  end


  describe '#destroy' do
      before do
        expect(subject).to receive(:resource) do
          double.tap { |a| expect(a).to receive(:destroy!) }
        end
      end

      before { process :destroy, method: :delete, params: params, format: :json }

      it { should render_template :destroy}
  end

end
