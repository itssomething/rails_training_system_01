class CourseSubjectsController < ApplicationController
  def new
  end

  def create
    params[:subjects].each do |subject_id|
      @course_subject = CourseSubject.new course_id:
        params[:course_subject][:course_id], subject_id: subject_id
      temp = CourseSubject.where course_id: params[:course_subject][:course_id]
      check = true
      temp.each do |t|
        if t.subject_id == @course_subject.subject_id
          check = false
          break
        end
      end
      @status = (check && @course_subject.save) ? 200 : 400
    end
  end
end
