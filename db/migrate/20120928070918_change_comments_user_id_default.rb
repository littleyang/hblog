class ChangeCommentsUserIdDefault < ActiveRecord::Migration
  def up
    change_column_default :comments,:user_id,nil
  end

  def down
  end
end
