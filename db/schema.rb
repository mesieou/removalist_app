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

ActiveRecord::Schema[7.0].define(version: 2024_02_20_023854) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date_time"
    t.integer "duration_in_minutes"
    t.integer "price"
    t.string "status"
    t.bigint "users_id", null: false
    t.bigint "locations_id", null: false
    t.bigint "services_id", null: false
    t.bigint "items_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id", null: false
    t.index ["items_id"], name: "index_bookings_on_items_id"
    t.index ["location_id"], name: "index_bookings_on_location_id"
    t.index ["locations_id"], name: "index_bookings_on_locations_id"
    t.index ["services_id"], name: "index_bookings_on_services_id"
    t.index ["users_id"], name: "index_bookings_on_users_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "estimated_total_loading_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pick_up"
    t.string "drop_off"
    t.string "pick_up_type_of_place"
    t.string "drop_off_type_of_place"
    t.string "pick_up_number_of_stories"
    t.string "drop_off_number_of_stories"
    t.string "pick_up_stairs_or_lift"
    t.string "drop_off_stairs_or_lift"
  end

  create_table "services", force: :cascade do |t|
    t.integer "number_of_removalists"
    t.boolean "packagin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "items", column: "items_id"
  add_foreign_key "bookings", "locations"
  add_foreign_key "bookings", "services", column: "services_id"
  add_foreign_key "bookings", "users", column: "users_id"
end
