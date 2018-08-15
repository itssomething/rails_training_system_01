class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  belongs_to :user_course
  has_many :user_reports
end
