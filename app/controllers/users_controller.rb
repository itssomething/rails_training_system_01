class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def import
    User.import_file params[:file]
    redirect_to root_url, notice: t(".data_imported")
  end
end
