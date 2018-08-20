class UserCoursesController < ApplicationController
  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @user_courses = UserCourse.where course_id: params[:id]
  end
end
