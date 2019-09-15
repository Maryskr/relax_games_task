require 'rails_helper'
require 'devise'

RSpec.describe DashboardsController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET #index' do

    context 'as non authorized user' do
      subject { get :index }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    context 'as authorized user' do
      let!(:dashboard) { create :dashboard }
      before(:each) { sign_in user }
      subject { get :index }

      it { expect(subject).to have_http_status(200) }
      it 'return dashboards list' do
        subject
        expect(assigns(:dashboards)).to eq([dashboard])
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { dashboard: { title: 'Hello', description: 'World!' } } }
    let(:invalid_params) { { dashboard: { title: nil, description: nil } } }

    context 'as non authorized user' do
      subject { post :create, { params: params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    context 'as authorized user with invalid params' do
      before { sign_in user }
      subject { post :create, { params: invalid_params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_dashboard_path }
    end

    context 'as authorized user with valid params' do
      before do
        sign_in user
        post :create, { params: params }
      end
      let(:dashboard) { Dashboard.last }

      it { expect(response).to have_http_status(302) }
      it { expect(Dashboard.count).to eq 1 }
      it { expect(dashboard.title).to eq params[:dashboard][:title] }
      it { expect(dashboard.description).to eq params[:dashboard][:description] }
    end
  end

  describe 'POST #update' do
    let!(:dashboard) { create(:dashboard) }
    let(:params) { { dashboard: { title: 'Hello', description: 'World!' } } }
    let(:invalid_params) { { dashboard: { title: nil, description: nil } } }

    context 'as non authorized user' do
      subject { post :update, { params: params.merge(id: dashboard.id) } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    context 'as authorized user with invalid params' do
      before { sign_in user }
      subject { post :update, { params: invalid_params.merge(id: dashboard.id) } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to edit_dashboard_path }
    end

    context 'as authorized user with valid params' do
      before do
        sign_in user
        post :update, { params: params.merge(id: dashboard.id) }
      end

      it { expect(response).to have_http_status(302) }
      it { expect(dashboard.reload.title).to eq params[:dashboard][:title] }
      it { expect(dashboard.reload.description).to eq params[:dashboard][:description] }
    end
  end
end
