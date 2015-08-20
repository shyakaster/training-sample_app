class AddTimestampsToIngredientsTable < ActiveRecord::Migration
  def up
    add_column :ingredients, :created_at,:timestamp, :after=>'name'
    add_column :ingredients, :updated_at,:timestamp, :after=>'created_at'
  end
  def down
    remove_column :ingredients, :created_at
    remove_column :ingredients, :updated_at
  end
end
