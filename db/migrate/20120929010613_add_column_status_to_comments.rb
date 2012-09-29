class AddColumnStatusToComments < ActiveRecord::Migration
  def change
    add_column :comments,:status,:boolean,:default=>false
  end
end
