require 'rails_helper'

describe UserDashboard do
  let(:user) { create(:user) }
  let(:dashboard) { create(:dashboard) }
  let(:user_dashboard) { UserDashboard.create(dashboard: dashboard, user: user) }

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :dashboard }
  end

  describe 'validators' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :dashboard_id }
  end

  describe 'destroy if dashboard has been destroyed' do
    before { user_dashboard.dashboard.destroy! }

    it { expect(UserDashboard.count).to eq(0) }
    it { expect(user.user_dashboards.count).to eq 0 }
  end

  describe 'destroy if user has been destroyed' do
    before { user_dashboard.user.destroy! }

    it { expect(UserDashboard.count).to eq(0) }
    it { expect(dashboard.user_dashboards.count).to eq 0 }
  end
end
