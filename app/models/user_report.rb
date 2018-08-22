class UserReport < ApplicationRecord
  belongs_to :user
  belongs_to :user_subject

  def get_subject
    Subject.find_by id: self.user_subject.subject_id
  end
end
