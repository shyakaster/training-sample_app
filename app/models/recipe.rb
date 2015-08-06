# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  chef_id     :integer
#  name        :string(255)
#  summary     :text(65535)
#  description :text(65535)
#

class Recipe < ActiveRecord::Base

   belongs_to :chef

   validates :name, presence: true, length:{minimum: 5, maximum: 100}
   validates :summary, presence: true, length: {minimum: 10, maximum: 150}
   validates :description, presence: true, length: {minimum: 20, maximum: 500}
   validates :chef_id, presence: true
end
