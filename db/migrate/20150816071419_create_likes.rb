class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
      t.boolean :like
      t.integer :chef_id,:recipe_id
      t.timestamps
    end
  end
  def down
    drop_table :likes
  end
end
