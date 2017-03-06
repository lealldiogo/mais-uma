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

ActiveRecord::Schema.define(version: 20170306152344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_profiles", force: :cascade do |t|
    t.integer  "section_id"
    t.integer  "user_id"
    t.string   "seat_info_1"
    t.string   "seat_info_2"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["section_id"], name: "index_customer_profiles_on_section_id", using: :btree
    t.index ["user_id"], name: "index_customer_profiles_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "away_team"
    t.string   "home_team"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_details_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_details_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_profile_id"
    t.string   "status",              default: "Feito"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["customer_profile_id"], name: "index_orders_on_customer_profile_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.boolean  "is_food"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_stocks", force: :cascade do |t|
    t.integer  "quantity"
    t.string   "stand"
    t.integer  "product_id"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_products_stocks_on_product_id", using: :btree
    t.index ["section_id"], name: "index_products_stocks_on_section_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_sections_on_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.integer  "section_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["section_id"], name: "index_users_on_section_id", using: :btree
  end

  add_foreign_key "customer_profiles", "sections"
  add_foreign_key "customer_profiles", "users"
  add_foreign_key "events", "users"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "customer_profiles"
  add_foreign_key "products_stocks", "products"
  add_foreign_key "products_stocks", "sections"
  add_foreign_key "sections", "events"
  add_foreign_key "users", "sections"
end
