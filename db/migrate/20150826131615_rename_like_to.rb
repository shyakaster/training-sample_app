class RenameLikeTo < ActiveRecord::Migration
  def change
    rename_column :review_likes, :like,:review_like
  end
end
