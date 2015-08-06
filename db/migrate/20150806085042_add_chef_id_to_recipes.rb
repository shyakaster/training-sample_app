class AddChefIdToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :chef_id,:integer, :after=>:id
  end
  def down
    remove_column :recipes, :chef_id
  end
end
