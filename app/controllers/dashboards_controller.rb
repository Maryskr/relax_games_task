class DashboardsController < ApplicationController
  def index
    # TODO: add kaminari pagination
    @dashboards = Dashboard.all
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard =  Dashboard.new(dashboard_params)
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
    params.require(:dashboard).permit(:title, :description)
  end
end
