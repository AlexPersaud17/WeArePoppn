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

ActiveRecord::Schema.define(version: 20170611170146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "guest_id"
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_comments_on_guest_id", using: :btree
  end

  create_table "guests", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_guests_on_party_id", using: :btree
    t.index ["user_id"], name: "index_guests_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "category",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_items", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "party_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["guest_id"], name: "index_list_items_on_guest_id", using: :btree
    t.index ["party_item_id"], name: "index_list_items_on_party_item_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.string   "location",    null: false
    t.datetime "date",        null: false
    t.integer  "host_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["host_id"], name: "index_parties_on_host_id", using: :btree
  end

  create_table "party_items", force: :cascade do |t|
    t.integer  "party_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_party_items_on_item_id", using: :btree
    t.index ["party_id"], name: "index_party_items_on_party_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "comments", "guests"
  add_foreign_key "guests", "parties"
  add_foreign_key "guests", "users"
  add_foreign_key "list_items", "guests"
  add_foreign_key "list_items", "party_items"
  add_foreign_key "party_items", "items"
  add_foreign_key "party_items", "parties"
end
