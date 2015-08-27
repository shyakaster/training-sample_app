# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  summary    :text(65535)
#  body       :text(65535)
#  chef_id    :integer
#  recipe_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :chef
  has_many :review_likes
  validates :body, :presence => true, length: {minimum: 15, maximum: 100}
  default_scope -> {order(updated_at: :desc)}
  def thumbs_up_total
    self.review_likes.where(review_like: true).size
  end
  def thumbs_down_total
    self.review_likes.where(review_like: false).size
  end
end
