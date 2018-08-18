class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all

    return if @subjects
    flash[:danger] = t "load_data_fail"
    redirect_to root_url
  end

  def update
    subject = Subject.find_by id: params[:id]
    if subject
      subject.update status: params[:subject][:status].to_i
    else
      flash[:danger] = t ".error"
      redirect_to subjects_path
    end
  end
end
