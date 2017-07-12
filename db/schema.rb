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

ActiveRecord::Schema.define(version: 20170712035242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "line_1"
    t.string "city"
    t.string "postal_code"
    t.string "province"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_addresses_on_event_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "event_litters", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "litter_id"
    t.index ["event_id"], name: "index_event_litters_on_event_id"
    t.index ["litter_id"], name: "index_event_litters_on_litter_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "planned_date"
    t.time "planned_time"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "notes"
  end

  create_table "litters", force: :cascade do |t|
    t.integer "amount"
    t.boolean "cleaned"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["user_id"], name: "index_litters_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.float "radius"
    t.bigint "litter_id"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_locations_on_event_id"
    t.index ["litter_id"], name: "index_locations_on_litter_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.boolean "is_organizer"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "event_litters", "events"
  add_foreign_key "event_litters", "litters"
  add_foreign_key "litters", "users"
  add_foreign_key "locations", "events"
  add_foreign_key "locations", "litters"
  add_foreign_key "locations", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end
