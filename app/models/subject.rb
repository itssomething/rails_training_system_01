class Subject < ApplicationRecord
  has_many :user_subjects
  has_many :course_subjects

  enum status: {active: 0, unactive: 1} 

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
end
