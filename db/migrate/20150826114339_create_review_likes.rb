class CreateReviewLikes < ActiveRecord::Migration
  def up
    create_table :review_likes do |t|
      t.boolean :like
      t.references :chef
      t.references :review
      t.timestamps
    end
  end
  def down
    drop_table :review_likes
  end
end
