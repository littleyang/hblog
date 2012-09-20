class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :user_id
      t.string :category_id

      t.timestamps
    end
  end
end
