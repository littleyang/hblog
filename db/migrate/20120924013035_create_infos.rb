class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :title
      t.text :detail
      t.string :user_id

      t.timestamps
    end
  end
end
