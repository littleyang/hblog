class RemoveUsersEmail < ActiveRecord::Migration
  def up
    remove_column :users,:email
  end

  def down
  end
end
