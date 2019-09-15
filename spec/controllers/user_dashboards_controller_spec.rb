require 'rails_helper'
require 'devise'

RSpec.describe UserDashboardsController, type: :controller do
  let!(:user) { create(:user) }
  let!(:dashboard) { create(:dashboard) }

  describe 'POST #create' do
    let(:params) { { dashboard_id: dashboard.id, user_id: user.id } }
    let(:invalid_params) { { dashboard_id: nil, user_id: nil } }

    context 'as non authorized user' do
      subject { post :create, { params: params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    context 'as authorized user with invalid params' do
      before { sign_in user }
      subject { post :create, { params: invalid_params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to dashboards_path }
    end

    context 'as authorized user with valid params' do
      before do
        sign_in user
        post :create, { params: params }
      end
      let(:user_dashboard) { UserDashboard.last }

      it { expect(response).to have_http_status(302) }
      it { expect(UserDashboard.count).to eq 1 }
      it { expect(user_dashboard.user_id).to eq user.id }
      it { expect(user_dashboard.dashboard_id).to eq dashboard.id }
    end
  end

  describe 'DELETE #destroy' do
    let!(:user_dashboard) { create(:user_dashboard) }
    let(:params) { { id: user_dashboard.id } }

    context 'as non authorized user' do
      subject { delete :destroy, { params: params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to new_user_session_path }
    end

    context 'as authorized user with valid params' do
      before { sign_in user }
      subject { delete :destroy, { params: params } }

      it { expect(subject).to have_http_status(302) }
      it { expect(subject).to redirect_to root_path }
      it { expect{ subject }.to change{ UserDashboard.count }.by(-1) }
    end
  end
end
