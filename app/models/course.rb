class Course < ApplicationRecord
  has_many :user_courses
  has_many :course_subjects

  def get_category
    cate = self.category
    case cate
    when 0
      return I18n.t("course_type_practice")
    when 1
      return I18n.t("course_type_open")
    else
      return I18n.t("course_type_intern")
    end
  end
end
