class Dashboard < ActiveRecord::Base
  belongs_to :user
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
