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

ActiveRecord::Schema.define(version: 20140121190535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body",        null: false
    t.integer  "learning_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "learnings", force: true do |t|
    t.text     "content",                 null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "likes_count", default: 0
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id",     null: false
    t.integer  "learning_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["user_id", "learning_id"], name: "index_likes_on_user_id_and_learning_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "github_uid",   null: false
    t.string   "name",         null: false
    t.string   "display_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gravatar"
  end

  add_index "users", ["github_uid"], name: "index_users_on_github_uid", unique: true, using: :btree

end
