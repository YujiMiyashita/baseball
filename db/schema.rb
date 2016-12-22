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

ActiveRecord::Schema.define(version: 20161221083014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ballparks", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status",     default: true
    t.integer  "team_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "ballparks", ["team_id"], name: "index_ballparks_on_team_id", using: :btree

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

  create_table "group_talk_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_talk_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "group_talk_members", ["group_talk_id"], name: "index_group_talk_members_on_group_talk_id", using: :btree
  add_index "group_talk_members", ["user_id"], name: "index_group_talk_members_on_user_id", using: :btree

  create_table "group_talk_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_talk_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "group_talk_messages", ["group_talk_id"], name: "index_group_talk_messages_on_group_talk_id", using: :btree
  add_index "group_talk_messages", ["user_id"], name: "index_group_talk_messages_on_user_id", using: :btree

  create_table "group_talks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "invitations", ["ticket_id"], name: "index_invitations_on_ticket_id", using: :btree
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id", using: :btree

  create_table "pennant_races", force: :cascade do |t|
    t.boolean  "league"
    t.integer  "first_team_id"
    t.integer  "second_team_id"
    t.integer  "third_team_id"
    t.integer  "fourth_team_id"
    t.integer  "fifth_team_id"
    t.integer  "sixth_team_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pennant_races", ["user_id"], name: "index_pennant_races_on_user_id", using: :btree

  create_table "personal_talk_members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "personal_talk_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "personal_talk_members", ["personal_talk_id"], name: "index_personal_talk_members_on_personal_talk_id", using: :btree
  add_index "personal_talk_members", ["user_id"], name: "index_personal_talk_members_on_user_id", using: :btree

  create_table "personal_talk_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "personal_talk_id"
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "personal_talk_messages", ["personal_talk_id"], name: "index_personal_talk_messages_on_personal_talk_id", using: :btree
  add_index "personal_talk_messages", ["user_id"], name: "index_personal_talk_messages_on_user_id", using: :btree

  create_table "personal_talks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "rankings", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rankings", ["user_id"], name: "index_rankings_on_user_id", using: :btree

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
    t.boolean  "league",     default: false
    t.boolean  "status",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.datetime "playball"
    t.integer  "user_id"
    t.integer  "ballpark_id"
    t.integer  "visitor_id"
    t.integer  "home_id"
    t.integer  "seat_id"
    t.integer  "number"
    t.datetime "post_start_at"
    t.datetime "post_end_at"
    t.integer  "status",        default: 0
    t.string   "detail"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "tickets", ["ballpark_id"], name: "index_tickets_on_ballpark_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  add_foreign_key "group_talk_members", "group_talks"
  add_foreign_key "group_talk_members", "users"
  add_foreign_key "group_talk_messages", "group_talks"
  add_foreign_key "group_talk_messages", "users"
  add_foreign_key "invitations", "tickets"
  add_foreign_key "invitations", "users"
  add_foreign_key "pennant_races", "users"
  add_foreign_key "personal_talk_members", "personal_talks"
  add_foreign_key "personal_talk_members", "users"
  add_foreign_key "personal_talk_messages", "personal_talks"
  add_foreign_key "personal_talk_messages", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rankings", "users"
  add_foreign_key "seats", "ballparks"
  add_foreign_key "tickets", "ballparks"
  add_foreign_key "tickets", "users"
end
