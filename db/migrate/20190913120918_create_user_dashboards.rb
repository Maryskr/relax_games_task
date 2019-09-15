class CreateUserDashboards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_dashboards do |t|
      t.belongs_to :user
      t.belongs_to :dashboard
      t.integer :order_number
      t.timestamps
    end
  end
end
