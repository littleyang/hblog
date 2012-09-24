class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments,:article_id,:string
  end
end
