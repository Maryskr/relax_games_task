class DashboardsController < ApplicationController
  def index
    @dashboards = current_user.dashboards
  end

  def new
    @dashboard = Dashboard.new(user: current_user)
  end

  def create
    @dashboard = current_user.dashboards.new(dashboard_params)
    if @dashboard.save
      flash[:success] = 'successfully created'
      redirect_to dashboards_path
    else
      flash[:errod] = 'Something get wrong'
      redirect_to :back
    end

  end

  private

  def dashboard_params
    params.require(:dashboard)
          .permit(:user_id, :title, :description, :order_number)
  end
end
