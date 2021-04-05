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

ActiveRecord::Schema.define(version: 2021_03_31_011142) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "uid"
  end

  create_table "appointments", force: :cascade do |t|
    t.string "location"
    t.text "comments"
    t.datetime "appt_datetime"
    t.integer "user_id", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_appointments_on_admin_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "toolkits", force: :cascade do |t|
    t.string "legal"
    t.string "documents"
    t.string "job"
    t.string "housing"
    t.string "financial"
    t.string "childcare"
    t.string "health"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_toolkits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "uid"
  end

  add_foreign_key "appointments", "admins"
  add_foreign_key "appointments", "users"
  add_foreign_key "toolkits", "users"
end
