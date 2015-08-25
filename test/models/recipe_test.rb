# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  chef_id     :integer
#  name        :string(255)
#  summary     :text(65535)
#  description :text(65535)
#  picture     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef=Chef.create(chefname:"mike mbanda",email:"mbandashyaka@gmail.com")
    @recipe = @chef.recipes.build(name: "test name",summary:"This is the best recipe ever",description:"boiled eggs and
very
many rice particles plus some grain")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end
  test "Chef_id has to be present" do
    @recipe.chef_id=" "
    assert_not @recipe.valid?
   end
  test "name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  test "name length should not be too long" do
    @recipe.name="a" * 101
    assert_not @recipe.valid?
  end
  test "name length should not be too short" do
    @recipe.name="a" * 4
    assert_not @recipe.valid?
  end
  test "summary should be present" do
    @recipe.summary=" "
    assert_not @recipe.valid?

  end
  test "summary length should not be too long" do
    @recipe.summary= "a" * 151
    assert_not @recipe.valid?
  end
  test "summary length should not be too short" do
    @recipe.summary= "a" * 9
    assert_not @recipe.valid?
  end
  test "description must be present" do
    @recipe.description= " "
    assert_not @recipe.valid?
  end
  test "description length should not be t0o long" do
    @recipe.description= "a" * 501
    assert_not @recipe.valid?
  end
  test "description length should not be too short" do
    @recipe.description= "a" * 19
    assert_not @recipe.valid?
  end
end

