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

ActiveRecord::Schema.define(version: 20161220011707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: true do |t|
    t.string   "part_id"
    t.string   "description"
    t.string   "part_type"
    t.integer  "min_year"
    t.integer  "max_year"
    t.string   "url"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "minifig_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["minifig_id"], name: "index_comments_on_minifig_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "heads", force: true do |t|
    t.string   "part_id"
    t.string   "description"
    t.string   "part_type"
    t.integer  "min_year"
    t.integer  "max_year"
    t.string   "url"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legs", force: true do |t|
    t.string   "part_id"
    t.string   "description"
    t.string   "part_type"
    t.integer  "min_year"
    t.integer  "max_year"
    t.string   "url"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "minifigs", force: true do |t|
    t.text     "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "head_id"
    t.integer  "torso_id"
    t.integer  "leg_id"
    t.integer  "accessory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minifigs", ["accessory_id"], name: "index_minifigs_on_accessory_id", using: :btree
  add_index "minifigs", ["head_id"], name: "index_minifigs_on_head_id", using: :btree
  add_index "minifigs", ["leg_id"], name: "index_minifigs_on_leg_id", using: :btree
  add_index "minifigs", ["torso_id"], name: "index_minifigs_on_torso_id", using: :btree
  add_index "minifigs", ["user_id"], name: "index_minifigs_on_user_id", using: :btree

  create_table "torsos", force: true do |t|
    t.string   "part_id"
    t.string   "description"
    t.string   "part_type"
    t.integer  "min_year"
    t.integer  "max_year"
    t.string   "url"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
