class Course < ApplicationRecord
  has_many :user_courses
  has_many :course_subjects

  def get_category
    cate = self.category
    case cate
    when 0
      return "Practice"
    when 1
      return "Open"
    else
      return "Intern"
    end
  end
end
