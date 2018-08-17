class UserCoursesController < ApplicationController
  def new; end

  def show
    @user_courses = UserCourse.where course_id: params[:id]
  end
end
