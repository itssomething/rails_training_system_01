class SubjectsController < ApplicationController
  before_action :find_subject, only: [:edit, :update]

  def index
    @subjects = Subject.all

    return if @subjects
    flash[:danger] = t "load_data_fail"
    redirect_to root_url
  end

  def edit; end

  def update
    byebug
    if params[:subject][:name]
      update_subject
    else
      @subject.update status: params[:subject][:status].to_i
    end
  end

  private

  def find_subject
    @subject = Subject.find_by id: params[:id]

    return if @subject
    flash[:danger] = t "load_data_fail"
    redirect_to subjects_path
  end

  def subject_params
    params.require(:subject).permit :name, :detail, :category, :status
  end

  def update_subject
    if @subject.update_attributes subject_params
      flash[:success] = t "success"
      redirect_to subjects_url
    else
      flash[:success] = t "no_success"
      render :edit
    end
  end
end
