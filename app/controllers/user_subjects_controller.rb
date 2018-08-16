class UserSubjectsController < ApplicationController
  def new; end

  def show
    @user_subjects = UserSubject.where subject_id: params[:id]
  end

  def update
    user_subject = UserSubject.find_by id: params[:id]
    if user_subject
      user_subject.update status: params[:user_subject][:status].to_i
    else
      flash[:danger] = t ".error"
      redirect_to user_subjects_show_path
    end
  end
end
