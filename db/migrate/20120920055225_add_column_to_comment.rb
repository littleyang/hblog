class AddColumnToComment < ActiveRecord::Migration
  def change
    add_column :comments,:article_id,:string
    remove_column :articles,:comment_id
  end
end
