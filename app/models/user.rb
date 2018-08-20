require 'roo'

class User < ApplicationRecord
  has_many :user_courses
  has_many :user_reports
  has_many :user_subjects
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  enum role: {admin: 0, trainer: 1, trainee: 2}
  enum type: {practice: 0, open: 1, intern: 2}

  class << self
    def import_file file
      spreadsheet = Roo::Spreadsheet.open file
      header = spreadsheet.row 1
      (2..spreadsheet.last_row).each do |i|
        row = [header, spreadsheet.row(i)].transpose.to_h
        row.merge!("password" => "123456", "password_confirmation" => "123456")
        create! row
      end
    end
  end
end
