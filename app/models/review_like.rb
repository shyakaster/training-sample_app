class ReviewLike < ActiveRecord::Base
  belongs_to :reviews
  belongs_to :chef
  validates_uniqueness_of :chef, scope: :review
end