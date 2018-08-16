class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  belongs_to :user_course
  has_many :user_reports

  enum status: {active: 0, unactive: 1} 
end
