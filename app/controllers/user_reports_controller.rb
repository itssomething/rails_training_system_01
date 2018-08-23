class UserReportsController < ApplicationController
  def index
    @user_reports = UserReport.all
    render template: "user_reports/show"
  end

  def show
    user_subject = UserSubject.find_by user_id: current_user.id,
      user_course_id: params[:id]
    @user_reports = UserReport.where user_id: current_user.id,
      user_subject_id: user_subject.id
    
    return if @user_reports
    flash[:danger] = t "load_data_fail"
    redirect_to user_course_path params[:id]
  end
end
