# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_10_201106) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "venue_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.string "website"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_neighborhoods_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "neighborhood_id", null: false
    t.string "address", null: false
    t.string "website", null: false
    t.index ["neighborhood_id"], name: "index_venues_on_neighborhood_id"
  end

  add_foreign_key "events", "venues"
  add_foreign_key "venues", "neighborhoods"
end
