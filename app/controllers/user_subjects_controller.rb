class UserSubjectsController < ApplicationController
  before_action :find_user_subject, only: [:edit, :update]

  def show
    @user_subjects = UserSubject.where subject_id: params[:id]
  end

  def edit; end

  def update
    if params[:user_subject][:progress]
      update_user_subject
    else
      @user_subject.update status: params[:user_subject][:status].to_i
    end
  end

  private

  def user_subject_params
    params.require(:user_subject)
          .permit :progress, :start_date, :end_date, :status
  end

  def update_user_subject
    if @user_subject.update_attributes user_subject_params
      flash[:success] = t "success"
      redirect_to user_subject_path @user_subject.subject_id
    else
      flash[:success] = t "no_success"
      render :edit
    end
  end

  def find_user_subject
    @user_subject = UserSubject.find_by id: params[:id]

    return if @user_subject
    flash[:danger] = t "load_data_fail"
    redirect_to user_subject_path @user_subject.subject_id
  end
end
