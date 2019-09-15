class UserDashboard < ActiveRecord::Base
  belongs_to :user
  belongs_to :dashboard

  validates :user_id, :dashboard_id, presence: true

  delegate :title, :description, to: :dashboard, allow_nil: true
end
