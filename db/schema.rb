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

ActiveRecord::Schema.define(version: 20170528165617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "day_id"
    t.integer  "group_id"
    t.boolean  "everyday",    default: false, null: false
    t.date     "date"
    t.index ["day_id"], name: "index_activities_on_day_id", using: :btree
    t.index ["group_id"], name: "index_activities_on_group_id", using: :btree
  end

  create_table "campus_areas", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_campus_areas_on_city_id", using: :btree
  end

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

  create_table "daily_percentages", force: :cascade do |t|
    t.date     "date"
    t.integer  "formal_assessment_percent"
    t.integer  "student_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["student_id"], name: "index_daily_percentages_on_student_id", using: :btree
  end

  create_table "day_tivities", force: :cascade do |t|
    t.integer  "day_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_day_tivities_on_activity_id", using: :btree
    t.index ["day_id"], name: "index_day_tivities_on_day_id", using: :btree
  end

  create_table "days", force: :cascade do |t|
    t.date     "name"
    t.integer  "cohort_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "city_id"
    t.integer  "week_number"
    t.boolean  "slack_sent",  default: false, null: false
    t.index ["city_id"], name: "index_days_on_city_id", using: :btree
    t.index ["cohort_id"], name: "index_days_on_cohort_id", using: :btree
  end

  create_table "group_tivities", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["activity_id"], name: "index_group_tivities_on_activity_id", using: :btree
    t.index ["group_id"], name: "index_group_tivities_on_group_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "day_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "description"
    t.boolean  "review"
    t.integer  "activity_level"
    t.boolean  "one_on_one"
    t.boolean  "ai_session"
    t.integer  "campus_area_id"
    t.boolean  "add_all_students"
    t.integer  "rigor_score"
    t.boolean  "advancement",      default: false, null: false
    t.boolean  "remediation",      default: false, null: false
    t.index ["campus_area_id"], name: "index_groups_on_campus_area_id", using: :btree
    t.index ["day_id"], name: "index_groups_on_day_id", using: :btree
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",                               null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",                          null: false
    t.string   "scopes"
    t.string   "previous_refresh_token", default: "", null: false
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.text     "redirect_uri",              null: false
    t.string   "scopes",       default: "", null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_groups", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_student_groups_on_group_id", using: :btree
    t.index ["student_id"], name: "index_student_groups_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "cohort_id"
    t.integer  "specialization_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "group_id"
    t.integer  "city_id"
    t.string   "email"
    t.string   "slack_username"
    t.string   "password_digest"
    t.index ["city_id"], name: "index_students_on_city_id", using: :btree
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

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "city_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "slack_username"
    t.index ["city_id"], name: "index_users_on_city_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activities", "days"
  add_foreign_key "activities", "groups"
  add_foreign_key "campus_areas", "cities"
  add_foreign_key "cohorts", "cities"
  add_foreign_key "daily_percentages", "students"
  add_foreign_key "day_tivities", "activities"
  add_foreign_key "day_tivities", "days"
  add_foreign_key "days", "cities"
  add_foreign_key "days", "cohorts"
  add_foreign_key "group_tivities", "activities"
  add_foreign_key "group_tivities", "groups"
  add_foreign_key "groups", "campus_areas"
  add_foreign_key "groups", "days"
  add_foreign_key "groups", "users"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "student_groups", "groups"
  add_foreign_key "student_groups", "students"
  add_foreign_key "students", "cities"
  add_foreign_key "students", "cohorts"
  add_foreign_key "students", "groups"
  add_foreign_key "students", "specializations"
  add_foreign_key "user_cohorts", "cohorts"
  add_foreign_key "user_cohorts", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "users", "cities"
end
