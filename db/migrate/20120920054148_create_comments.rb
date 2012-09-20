class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :nikeName
      t.string :email
      t.string :comment

      t.timestamps
    end
  end
end
