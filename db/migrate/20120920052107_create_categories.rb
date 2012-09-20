class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryName
      t.string :categoryDesc

      t.timestamps
    end
  end
end
