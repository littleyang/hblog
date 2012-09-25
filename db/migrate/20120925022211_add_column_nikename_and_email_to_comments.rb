class AddColumnNikenameAndEmailToComments < ActiveRecord::Migration
  def change
    add_column :comments,:nikename,:string,:default=>"kitty"
    add_column :comments,:email,:string
  end
end
