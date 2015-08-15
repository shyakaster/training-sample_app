# == Schema Information
#
# Table name: chefs
#
#  id         :integer          not null, primary key
#  chefname   :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Chef < ActiveRecord::Base

  before_save {self.email=email.downcase}

  has_many :recipes

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :chefname, presence: true, length: {maximum: 25, minimum: 5}
  validates :email, presence: true, length: {maximum: 25}, uniqueness: {case_sensitive: false},format:
                      {with:email_regex}
end
