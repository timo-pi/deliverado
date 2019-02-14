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

ActiveRecord::Schema.define(version: 2019_02_14_150618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.integer "status"
    t.bigint "request_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "signature"
    t.index ["request_id"], name: "index_deliveries_on_request_id"
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "order_number"
    t.string "delivery_address"
    t.string "size"
    t.text "message"
    t.datetime "time_from"
    t.datetime "time_to"
    t.string "phone_number"
    t.string "customer_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.bigint "store_id"
    t.integer "status", default: 0
    t.integer "price"
    t.index ["store_id"], name: "index_requests_on_store_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "start_address"
    t.string "end_address"
    t.integer "delivery_radius"
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_longitude"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "store_name"
    t.string "store_address"
    t.string "store_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deliveries", "requests"
  add_foreign_key "deliveries", "users"
  add_foreign_key "requests", "stores"
  add_foreign_key "routes", "users"
end
