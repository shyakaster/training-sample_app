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
  validates :body, :presence => true, length: {minimum: 15, maximum: 100}
end
