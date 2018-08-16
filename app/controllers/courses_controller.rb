class CoursesController < ApplicationController
  def show
    @course = Course.all

    return if @course
    flash[:danger] = t "load_data_fail"
    redirect_to root_url
  end
end
