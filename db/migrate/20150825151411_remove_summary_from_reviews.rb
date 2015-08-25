class RemoveSummaryFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :summary
  end
end
