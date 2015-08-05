class CreateChefs < ActiveRecord::Migration
  def up
    create_table :chefs do |t|
      t.string :chefname
      t.string :email
      t.timestamps
    end
  end
  def down
    drop_table :chefs
  end
end
