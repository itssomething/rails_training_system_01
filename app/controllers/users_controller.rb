class UsersController < ApplicationController
  def import
    User.import_file params[:file]
    redirect_to root_url, notice: "Data imported"
  end
end
