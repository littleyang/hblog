class ChangeCommentsUserIdDefaultNull < ActiveRecord::Migration
  def up
    remove_index :comments,:user_id
  end

  def down
  end
end
