require "roo"

class User < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :user_reports, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  # enum role: {admin: 0, trainer: 1, trainee: 2}
  enum trainee_type: {practice: 0, open: 1, intern: 2}

  self.inheritance_column = :role

  def isTrainee
    self.role == Settings.trainee
  end

  class << self
    def import_file file
      spreadsheet = Roo::Spreadsheet.open file
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        row["password"] = Settings.password
        row["password_confirmation"] = Settings.password
        create! row
      end
    end

    def roles
      %w(Admin Trainer Trainee)
    end
  end
end
