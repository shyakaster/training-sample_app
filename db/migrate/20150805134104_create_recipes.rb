class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.text :summary
      t.text :description
    end
  end
  def down
    drop_table :recipes
  end
end
