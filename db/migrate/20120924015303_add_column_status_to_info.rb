class AddColumnStatusToInfo < ActiveRecord::Migration
  def change
    add_column :infos,:stauts,:boolean,:default=>false
  end
end
