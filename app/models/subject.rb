class Subject < ApplicationRecord
  has_many :user_subjects
  has_many :course_subjects

  def get_category
    case self.category
    when 0
      return I18n.t("subject_type_git")
    when 1
      return I18n.t("subject_type_ruby")
    else
      return I18n.t("subject_type_rails")
    end
  end

  def get_status
    case self.status
    when 0
      return I18n.t("start")
    when 1
      return I18n.t("inprogess")
    else
      return I18n.t("end")
    end
  end
end
