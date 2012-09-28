class ChangeCommentsUserToNull < ActiveRecord::Migration
  def up
    change_column :comments,:user_id,:string,:null=>true
  end

  def down
  end
end
