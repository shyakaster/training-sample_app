class AddRecipeidOnReviewLikes < ActiveRecord::Migration
  def up
    add_column :review_likes, :recipe_id, :integer, after: :chef_id
  end
  def down
    remove_column :review_likes, :recipe_id
  end
end
