class UserReportsController < ApplicationController
  def index
    @user_reports = UserReport.all
    render template: "user_reports/show"
  end

  def new; end

  def create
    return create_user_report if params[:user_report][:title]
    @start_date = params[:user_report][:start_date]
    @end_date = params[:user_report][:end_date]
    check_input_date

    if @is_date_input_fail
      flash[:danger] = t "input_date_fail"
      @user_reports = UserReport.all
      render template: "user_reports/show"
      return
    end
    @user_subjects = UserSubject.where(subject_id: params[:user_report][:subject_id])
      .pluck :id
    select_report_condition
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

  private

  def check_input_date
    @is_date_input_fail = false
    if @start_date.present? && @start_date.to_date > Date.current
      @is_date_input_fail = true
    elsif @end_date.present? && @end_date.to_date > Date.current
      @is_date_input_fail = true
    elsif @start_date.present? && @end_date.present?
      @is_date_input_fail = true if @start_date.to_date > @end_date.to_date
    end
  end

  def select_report_condition
    if @start_date.present? && @end_date.present?
      @user_reports = UserReport.where user_subject_id: @user_subjects,
        created_at: @start_date.to_date..@end_date.to_date
    elsif @start_date.present?
      @user_reports = UserReport.where(user_subject_id: @user_subjects)
        .where "created_at > ?", @start_date
    elsif @end_date.present?
      @user_reports = UserReport.where(user_subject_id: @user_subjects)
        .where "created_at < ?", @end_date
    else
      @user_reports = UserReport.where user_subject_id: @user_subjects
    end
  end

  def create_user_report
    user_subject = UserSubject.find_by user_id: current_user,
      subject_id: params[:user_report][:subject_id]
    user_report = UserReport.new title: params[:user_report][:title],
      content: params[:user_report][:content],
      user_id: current_user.id, user_subject: user_subject

    if user_report.save
      flash[:success] = t "success"
      redirect_to user_reports_path
    else
      flash[:danger] = t "no_success"
      render :new
    end
  end
end
