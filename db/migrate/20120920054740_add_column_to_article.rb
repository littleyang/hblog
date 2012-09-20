class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles,:comment_id,:string
  end
end
