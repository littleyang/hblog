class AddStatusToArticle < ActiveRecord::Migration
  def change
    add_column :articles,:status,:string,:default=>1
  end
end
