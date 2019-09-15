class UserDashboard < ActiveRecord::Base
  include RailsSortable::Model

  belongs_to :user
  belongs_to :dashboard

  validates :user_id, :dashboard_id, presence: true

  delegate :title, :description, to: :dashboard, allow_nil: true

  set_sortable :order_number
end
