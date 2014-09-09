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

ActiveRecord::Schema.define(version: 20140908104135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.text     "creator"
    t.integer  "amount"
  end

  add_index "challenges", ["event_id"], name: "index_challenges_on_event_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "event_date"
    t.string   "charity"
    t.integer  "target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "training"
    t.float    "amount_raised"
    t.integer  "jg_event_id"
    t.string   "jg_short_name"
    t.integer  "jg_page_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "identities", force: true do |t|
    t.string  "provider"
    t.integer "uid"
    t.text    "token"
    t.integer "user_id"
    t.text    "secret"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "pledges", force: true do |t|
    t.string   "title"
    t.integer  "amount"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  add_index "pledges", ["event_id"], name: "index_pledges_on_event_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "event_id"
    t.integer  "user_id"
    t.text     "video"
    t.string   "text"
  end

  add_index "posts", ["event_id"], name: "index_posts_on_event_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "trainingsessions", force: true do |t|
    t.text     "details"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "sessiondate"
    t.string   "mmf_updated_datetime"
    t.string   "mmf_route_id"
  end

  add_index "trainingsessions", ["event_id"], name: "index_trainingsessions_on_event_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
