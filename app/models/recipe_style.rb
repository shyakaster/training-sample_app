# == Schema Information
#
# Table name: recipe_styles
#
#  id         :integer          not null, primary key
#  style_id   :integer
#  recipe_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class RecipeStyle < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :style
end
