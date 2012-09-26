class AddPermissionToUser < ActiveRecord::Migration
  def change
    add_column :users,:permission,:string,:default=>2
  end
end
