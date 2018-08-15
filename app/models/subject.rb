class Subject < ApplicationRecord
  has_many :user_subjects
  has_many :course_subjects
end
