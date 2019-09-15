class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_recourse, only: [:edit, :update]

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Successfully updated'
      redirect_to root_path
    else
      flash[:error] = 'Errors occured'
      redirect_back(fallback_location: edit_user_path(@user))
    end
  end

  private

  def find_recourse
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone
    )
  end
end
