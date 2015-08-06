class AddTimestampsOnRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :created_at, :timestamp
    add_column :recipes, :updated_at, :timestamp, :after=>:created_at
  end
  def down
    remove_columns :recipes, :created_at, :updated_at
  end
end
