class SubjectsController < ApplicationController
  def show
    @subject = Subject.all

    return if @subject
    flash[:danger] = t "load_data_fail"
    redirect_to root_url
  end
end
