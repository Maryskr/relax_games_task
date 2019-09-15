class UserDashboardsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_dashboard = current_user.user_dashboards.new(user_dashboard_params)
    @user_dashboard.save ? render_success : render_error
  end

  def destroy
    @user_dashboard = UserDashboard.find(params[:id])
    @user_dashboard.destroy ? render_success : render_error
  end

  private

  def render_success
    flash[:success] = 'successfully'
    redirect_to root_path
  end

  def render_error
    flash[:errod] = 'Something get wrong'
    redirect_back(fallback_location: @user_dashboard)
  end

  def user_dashboard_params
    params.permit(:dashboard_id)
  end
end
