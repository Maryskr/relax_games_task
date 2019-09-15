class UserDashboardsController < ApplicationController
  before_action :find_recourse, only: [:edit, :destroy, :update]

  def new
    @user_dashboard = current_user.user_dashboards.build(dashboard_id: params[:dashboard_id])
  end

  def create
    @user_dashboard = UserDashboard.new(user_dashboard_params)
    @user_dashboard.save ? render_success : render_error
  end

  def edit; end

  def update
    @user_dashboard.update(user_dashboard_params) ? render_success : render_error
  end

  def destroy
    @user_dashboard.destroy ? render_success : render_error
  end

  private

  def find_recourse
    @user_dashboard = UserDashboard.find(params[:id])
  end

  def render_success
    flash[:success] = 'successfully'
    redirect_to root_path
  end

  def render_error
    flash[:errod] = 'Something get wrong'
    redirect_back(fallback_location: @user_dashboard)
  end

  def user_dashboard_params
    params.require(:user_dashboard)
          .permit(:user_id, :dashboard_id, :order_number)
  end
end
