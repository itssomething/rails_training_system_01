class CoursesController < ApplicationController
  def show
    @course = Course.all

    return if @course
    flash[:danger] = "Khong co du lieu"
    redirect_to root_url
  end
end
