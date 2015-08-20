class CreateRecipeStyles < ActiveRecord::Migration
  def up
    create_table :recipe_styles do |t|
      t.integer :style_id
      t.integer :recipe_id
      t.timestamps
    end
  end
  def down
    drop_table :recipe_styles
  end
end
