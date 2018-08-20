class RenameTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :trainee_type
  end
end
