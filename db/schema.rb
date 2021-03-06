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

ActiveRecord::Schema.define(version: 20170621095717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "quote"
    t.integer "winning_bid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "winning_bid_date"
    t.index ["task_id"], name: "index_bids_on_task_id"
    t.index ["user_id"], name: "index_bids_on_user_id"
  end

  create_table "task_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category_image_file_name"
    t.string "category_image_content_type"
    t.integer "category_image_file_size"
    t.datetime "category_image_updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "location"
    t.integer "minimum_budget"
    t.integer "maximum_budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "task_category_id"
    t.string "status"
    t.string "slug"
    t.bigint "user_id"
    t.string "time_frame"
    t.string "task_image_file_name"
    t.string "task_image_content_type"
    t.integer "task_image_file_size"
    t.datetime "task_image_updated_at"
    t.index ["task_category_id"], name: "index_tasks_on_task_category_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "insurance"
    t.string "contractor_description"
    t.string "user_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.string "contractor_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bids", "tasks"
  add_foreign_key "bids", "users"
  add_foreign_key "tasks", "task_categories"
  add_foreign_key "tasks", "users"
end
