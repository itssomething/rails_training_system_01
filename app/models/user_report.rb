class UserReport < ApplicationRecord
  belongs_to :users
  belongs_to :user_subject
end
