class UserAddByTrainersController < ApplicationController
  def create
    @user = Object.const_get(params[:user][:role].capitalize).new user_params
    if @user.save
      respond_to do |format|
        format.html{redirect_to root_url}
        format.js
      end
    else
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :type, :trainee_type)
          .merge! password: Settings.password,
            password_confirmation: Settings.password
  end
end
