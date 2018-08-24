class Trainee < User
  def get_subject
    user_course = UserCourse.where(user_id: self.id)
      .where "end_date > ?", Date.current
    user_subject = UserSubject.where(user_id: self.id,
      user_course_id: user_course.first.id).pluck :id
    @subjects = Subject.where id: user_subject
  end
end
