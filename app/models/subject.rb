class Subject < ApplicationRecord
  has_many :user_subjects
  has_many :course_subjects

  validates :name, :detail, presence: true

  enum status: {active: 0, unactive: 1}
  enum category: {git: 0, ruby: 1, rails: 2}

  def get_category
    I18n.t("subject_type_#{self.category}")
  end
end
