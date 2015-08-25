# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150825151411) do

  create_table "chefs", force: :cascade do |t|
    t.string   "chefname",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           limit: 1,   default: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "like",       limit: 1
    t.integer  "chef_id",    limit: 4
    t.integer  "recipe_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer  "ingredient_id", limit: 4
    t.integer  "recipe_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_styles", force: :cascade do |t|
    t.integer  "style_id",   limit: 4
    t.integer  "recipe_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "chef_id",     limit: 4
    t.string   "name",        limit: 255
    t.text     "summary",     limit: 65535
    t.text     "description", limit: 65535
    t.string   "picture",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body",       limit: 65535
    t.integer  "recipe_id",  limit: 4
    t.integer  "chef_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
