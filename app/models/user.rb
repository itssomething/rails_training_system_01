class User < ApplicationRecord
  has_many :user_courses
  has_many :user_reports
  has_many :user_subjects
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  enum role: [:trainer, :trainee]
  enum type: [:practice, :open, :intern]
end
