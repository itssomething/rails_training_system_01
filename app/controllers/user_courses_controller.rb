class UserCoursesController < ApplicationController
  def new; end

  def create
    byebug
    params[:user_ids].split(",").each do |value|
      @user_course = UserCourse.new user_id: value, course_id: params[:course_id]
      if @user_course.save
        respond_to do |format|
          format.js
        end
      else
        flash[:danger] = t ".failed"
      end
    end
  end

  def show
    @user_courses = UserCourse.where course_id: params[:id]
  end
end
