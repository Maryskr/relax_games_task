class HomeController < ApplicationController
  def index
    if current_user
      @user_dashboards = current_user.user_dashboards.order(order_number: :asc)
      render 'user_dashboards/index'
    end
  end
end
