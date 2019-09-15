class Dashboard < ActiveRecord::Base
  has_many :user_dashboards, dependent: :destroy
  validates :title, :description, presence: true
end

# == Schema Information
#
# Table name: dashboards
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
