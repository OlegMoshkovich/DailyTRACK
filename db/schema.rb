# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140923222453) do

  create_table "concrete_summaries", force: true do |t|
    t.string   "date"
    t.integer  "baseline_early_ind"
    t.integer  "baseline_early_cum"
    t.integer  "baseline_late_ind"
    t.integer  "baseline_late_cum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "daily_reports", force: true do |t|
    t.string   "narrative"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "inspection_reports", force: true do |t|
    t.string   "inspector"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "inspection_reports", ["user_id"], name: "index_inspection_reports_on_user_id"

  create_table "inspections", force: true do |t|
    t.string   "heading"
    t.string   "element"
    t.string   "start"
    t.string   "finish"
    t.string   "operation"
    t.integer  "inspection_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "daily_report_id"
  end

  add_index "inspections", ["daily_report_id"], name: "index_inspections_on_daily_report_id"
  add_index "inspections", ["inspection_report_id"], name: "index_inspections_on_inspection_report_id"

  create_table "narratives", force: true do |t|
    t.string   "narrative"
    t.integer  "daily_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "narratives", ["daily_report_id"], name: "index_narratives_on_daily_report_id"

  create_table "notes", force: true do |t|
    t.string   "observation"
    t.integer  "inspection_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["inspection_report_id"], name: "index_notes_on_inspection_report_id"

  create_table "project_dashboards", force: true do |t|
    t.string   "contract"
    t.string   "title"
    t.string   "contractor"
    t.string   "cm"
    t.string   "scheduler"
    t.string   "period_start"
    t.date     "period_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
