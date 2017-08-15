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

ActiveRecord::Schema.define(version: 20170602074804) do

  create_table "brands", force: :cascade do |t|
    t.string   "brand_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "item_id",                null: false
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "img_url"
    t.integer  "manufacture_year"
    t.string   "frame"
    t.string   "fork"
    t.string   "size"
    t.string   "color"
    t.integer  "price"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.boolean  "is_check"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "orderitem_ships", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "price"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "phone"
    t.text     "address"
    t.string   "email"
    t.integer  "amount"
    t.string   "payment_method"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "order_status",   default: 0
    t.integer  "payment_status"
    t.index ["order_status"], name: "index_orders_on_order_status"
    t.index ["payment_status"], name: "index_orders_on_payment_status"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "payment_method"
    t.integer  "amount"
    t.datetime "paid_at"
    t.text     "params"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "ubikes", force: :cascade do |t|
    t.integer  "station_number"
    t.string   "station_name"
    t.string   "area"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "ubike_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
