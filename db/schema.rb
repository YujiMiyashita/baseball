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

ActiveRecord::Schema.define(version: 20161108152744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ballparks", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "favorites", ["from_user_id", "to_user_id"], name: "index_favorites_on_from_user_id_and_to_user_id", unique: true, using: :btree
  add_index "favorites", ["from_user_id"], name: "index_favorites_on_from_user_id", using: :btree
  add_index "favorites", ["to_user_id"], name: "index_favorites_on_to_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "avatar"
    t.string   "image_url"
    t.integer  "user_id"
    t.text     "content"
    t.string   "nick_name"
    t.string   "back_image"
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "ballpark_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["ballpark_id"], name: "index_profiles_on_ballpark_id", using: :btree
  add_index "profiles", ["player_id"], name: "index_profiles_on_player_id", using: :btree
  add_index "profiles", ["team_id"], name: "index_profiles_on_team_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "seats", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "ballpark_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "seats", ["ballpark_id"], name: "index_seats_on_ballpark_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "playball"
    t.integer  "user_id"
    t.integer  "ballpark_id"
    t.integer  "visitor_id"
    t.integer  "home_id"
    t.integer  "number"
    t.integer  "price"
    t.datetime "post_start_at"
    t.datetime "post_end_at"
    t.boolean  "status",        default: false
    t.boolean  "format",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "tickets", ["ballpark_id"], name: "index_tickets_on_ballpark_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "tribes", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tribes", ["followed_id"], name: "index_tribes_on_followed_id", using: :btree
  add_index "tribes", ["follower_id", "followed_id"], name: "index_tribes_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "tribes", ["follower_id"], name: "index_tribes_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "user_name",              default: "（変更してください）", null: false
    t.string   "image_url"
    t.integer  "status",                 default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  add_foreign_key "blogs", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "seats", "ballparks"
  add_foreign_key "tickets", "ballparks"
  add_foreign_key "tickets", "users"
end
