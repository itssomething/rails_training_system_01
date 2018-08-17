class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update]

  def index
    @course = Course.all

    return if @course
    flash[:danger] = t "load_data_fail"
    redirect_to root_url
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new course_params

    if @course.save
      flash[:success] = t ".created"
      redirect_to root_path
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def show; end

  def edit
    redirect_to courses_path if @course.save
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t ".save_success"
      redirect_to @course
    else
      flash[:danger] = t ".save_failed"
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit :name, :detail, :category
  end

  def find_course
    @course = Course.find_by id: params[:id]

    return if @course
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end
end
