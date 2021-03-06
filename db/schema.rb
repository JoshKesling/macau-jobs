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

ActiveRecord::Schema.define(version: 20180225113736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cvs", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "marital_status"
    t.integer "children"
    t.string "phone_number"
    t.string "current_city"
    t.string "current_country"
    t.text "skills"
    t.boolean "work_visa"
    t.date "visa_exp_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "passport_country"
    t.string "passport_number"
    t.date "passport_expiration_date"
    t.string "head_pic_file_name"
    t.string "head_pic_content_type"
    t.integer "head_pic_file_size"
    t.datetime "head_pic_updated_at"
    t.string "body_pic_file_name"
    t.string "body_pic_content_type"
    t.integer "body_pic_file_size"
    t.datetime "body_pic_updated_at"
    t.string "current_address"
    t.string "visa_country"
    t.boolean "completed"
    t.index ["user_id"], name: "index_cvs_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.bigint "cv_id"
    t.string "name"
    t.string "city"
    t.string "country"
    t.integer "years_attended"
    t.integer "year_completed"
    t.integer "months_attended"
    t.boolean "graduated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_educations_on_cv_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "open"
    t.datetime "closed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "summary"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.index ["agent_id"], name: "index_jobs_on_agent_id"
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.bigint "cv_id"
    t.string "name"
    t.string "read"
    t.string "write"
    t.string "speak"
    t.string "listen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_languages_on_cv_id"
  end

  create_table "previous_employments", force: :cascade do |t|
    t.string "employer_name"
    t.text "job_duties"
    t.integer "months"
    t.integer "years"
    t.integer "ended_year"
    t.string "location"
    t.bigint "cv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_previous_employments_on_cv_id"
  end

  create_table "user_jobs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_user_jobs_on_job_id"
    t.index ["user_id"], name: "index_user_jobs_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "cvs", "users"
  add_foreign_key "educations", "cvs"
  add_foreign_key "jobs", "agents"
  add_foreign_key "jobs", "users"
  add_foreign_key "languages", "cvs"
  add_foreign_key "previous_employments", "cvs"
  add_foreign_key "user_jobs", "jobs"
  add_foreign_key "user_jobs", "users"
end
