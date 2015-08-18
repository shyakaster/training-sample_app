class AddPasswordDigestToChefs < ActiveRecord::Migration
  def up
    add_column :chefs, :password_digest,:string, :after=>'email'
  end
  def down
    remove_column :chefs, :password_digest
  end
end
