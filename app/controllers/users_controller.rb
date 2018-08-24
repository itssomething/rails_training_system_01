class UsersController < ApplicationController
  before_action :find_user, only: [:destroy]

  def index
    @users = Trainee.all
  end

  def destroy
    if @user.destroy
      flash[:success] = t "success"
      redirect_to users_path
    else
      flash[:danger] = t "delete_failed"
    end
  end

  def import
    User.import_file params[:file]
    redirect_to root_url, notice: t(".data_imported")
  end

  private

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t "user_not_found"
    redirect_to root_path
  end
end
