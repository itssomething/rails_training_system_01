class Course < ApplicationRecord
  has_many :user_courses
  has_many :course_subjects

  enum category: {practice: 0, open: 1, intern: 2}

  def get_category
    I18n.t("course_type_#{self.category}")
  end

  validates :name, :detail, presence: true
end
