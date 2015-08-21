class AddAdminToChefs < ActiveRecord::Migration
  def up
    add_column :chefs, :admin,:boolean, default: false
  end
  def down
    remove_column :chefs, :admin
  end
end
