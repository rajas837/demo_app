class RenameColumnOfUsersFromPasswordConfirmToConfirmPassword < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_confirm, :confirm_password
  end
end
