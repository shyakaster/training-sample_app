class AddPictureToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :picture, :string, :after=>'description'
  end
  def down
    remove_column :recipes, :picture
  end
end
