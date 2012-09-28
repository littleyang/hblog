class RenameColumnUsersAndRemovePs < ActiveRecord::Migration
  def up
    rename_column :users,:userName,:username
    remove_column :users,:userPassword
  end

  def down
  end
end
