class RenameColumnStatusToInfo < ActiveRecord::Migration
  def up
    rename_column :infos,:stauts,:status
  end

  def down
  end
end
