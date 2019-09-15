require 'rails_helper'

describe UserDashboard do
  let(:user) { create(:user) }
  let(:dashboard) { create(:dashboard) }

  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :dashboard }
  end

  describe 'validators' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :dashboard_id }
  end
end
