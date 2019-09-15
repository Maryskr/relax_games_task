FactoryBot.define do
  factory :user_dashboard do
    user { create(:user) }
    dashboard { create(:dashboard) }
  end
end
