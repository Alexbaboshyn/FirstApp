 require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { should be_an ApplicationController }

  describe '#index' do
    before { process :index, method: :get, format: :json }

    it { should render_template :index }
  end


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
    before { expect(subject).to receive(:params).and_return({ id: 1 }) }

    before { expect(User).to receive(:find).with(1).and_return(:resource) }

    its(:resource) { should eq :resource }
  end


  describe '#destroy' do
    let(:resource) { stub_model User }

    let(:params) { {id: '1'} }

    before { expect(User).to receive(:find).with('1').and_return(resource) }

    before { expect(resource).to receive(:destroy!) }

    before { process :destroy, method: :delete, params: params, format: :json }

    it { should render_template :destroy }
  end


  describe '#update' do
    let(:params) {{ name: 'Bob' }}

    let(:resource) { stub_model User }

    before { expect(User).to receive(:find).with("1").and_return(resource) }

    before { expect(resource).to receive(:update!).with(permit! params) }

    before { process :update, method: :patch, params: { id: "1", name: "Bob" }, format: :json }

    it { should render_template :update }
  end
end
