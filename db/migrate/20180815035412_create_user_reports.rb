class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.references :user_subject, foreign_key: true

      t.timestamps
    end
  end
end
