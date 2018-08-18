class CreateUserSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_subjects do |t|
      t.integer :progress
      t.integer :status
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
      t.references :subject, foreign_key: true
      t.references :user_course, foreign_key: true

      t.timestamps
    end
  end
end
