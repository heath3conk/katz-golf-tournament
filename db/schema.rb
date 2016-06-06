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

ActiveRecord::Schema.define(version: 20160606144214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diners", force: :cascade do |t|
    t.integer  "signup_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "diner_first_name"
    t.string   "diner_last_name"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "signup_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "player_first_name"
    t.string   "player_last_name"
  end

  create_table "signups", force: :cascade do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "contact_number"
    t.integer  "additional_donation"
    t.integer  "total"
    t.string   "paid_status",         default: "unpaid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "signup_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "buffet",         default: 0
    t.integer  "beverage_cart",  default: 0
    t.integer  "at_the_turn",    default: 0
    t.integer  "closest_to_pin", default: 0
    t.integer  "longest_drive",  default: 0
    t.integer  "tee_box",        default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
