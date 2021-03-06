class DashboardsController < ApplicationController
  before_action :authenticate_user!

  PER = 4

  def index
    @dashboards = Dashboard.all.page(params[:page]).per(PER)
  end

  def new
    @dashboard = Dashboard.new
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)
    if @dashboard.save
      flash[:success] = 'successfully created'
      redirect_to dashboards_path
    else
      flash[:errod] = 'Something get wrong'
      redirect_back(fallback_location: new_dashboard_path)
    end
  end

  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  def update
    @dashboard = Dashboard.find(params[:id])
    if @dashboard.update(dashboard_params)
      flash[:success] = 'Successfully saved'
      redirect_to dashboards_path
    else
      flash[:errod] = 'Something get wrong'
      redirect_back(fallback_location: edit_dashboard_path(@dashboard))
    end
  end

  private

  def dashboard_params
    params.require(:dashboard).permit(:title, :description)
  end
end
