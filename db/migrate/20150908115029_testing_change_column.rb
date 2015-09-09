class TestingChangeColumn < ActiveRecord::Migration
  def up
    change_column :recipes, :picture,:string, :limit => 225
  end
  def down
    change_column :recipes, :picture,:string, :limit => 150
  end
end
