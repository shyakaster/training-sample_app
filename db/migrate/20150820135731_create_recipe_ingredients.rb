class CreateRecipeIngredients < ActiveRecord::Migration
  def up
    create_table :recipe_ingredients do |t|
      t.integer :ingredient_id
      t.integer :recipe_id
      t.timestamps
    end
  end
  def down
    drop_table :recipe_ingredients
  end
end
