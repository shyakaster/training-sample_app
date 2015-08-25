class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.text :summary
      t.text :body
      t.references :recipe
      t.references :chef
      t.timestamps
    end
  end
  def down
    drop_table :reviews
  end
end
