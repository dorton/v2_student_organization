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

ActiveRecord::Schema.define(version: 20170509020436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "course_name"
    t.integer  "city_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_id"], name: "index_cohorts_on_city_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.date     "name"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_days_on_cohort_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["day_id"], name: "index_groups_on_day_id", using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "cohort_id"
    t.integer  "specialization_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "group_id"
    t.index ["cohort_id"], name: "index_students_on_cohort_id", using: :btree
    t.index ["group_id"], name: "index_students_on_group_id", using: :btree
    t.index ["specialization_id"], name: "index_students_on_specialization_id", using: :btree
  end

  create_table "user_cohorts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_user_cohorts_on_cohort_id", using: :btree
    t.index ["user_id"], name: "index_user_cohorts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
  end

  add_foreign_key "cohorts", "cities"
  add_foreign_key "days", "cohorts"
  add_foreign_key "groups", "days"
  add_foreign_key "groups", "users"
  add_foreign_key "students", "cohorts"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "specializations"
  add_foreign_key "user_cohorts", "cohorts"
  add_foreign_key "user_cohorts", "users"
  add_foreign_key "users", "cities"
end
