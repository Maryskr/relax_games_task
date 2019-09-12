class AddUserAndOrderNumberToDashboard < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :dashboards, :user
    add_column :dashboards, :order_number, :integer
  end
end
