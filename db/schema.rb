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

ActiveRecord::Schema.define(version: 2018_05_30_082647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidatures", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "url_flat_id"
    t.index ["url_flat_id"], name: "index_candidatures_on_url_flat_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "nb_room"
    t.string "address"
    t.string "price"
    t.string "surface"
    t.index ["agency_id"], name: "index_flats_on_agency_id"
  end

  create_table "guarantors", force: :cascade do |t|
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.date "birthday_date"
    t.text "address"
    t.string "nationality"
    t.string "couple_status"
    t.string "mail"
    t.integer "child_number"
    t.string "job_name"
    t.string "employment_contract"
    t.string "identity_card"
    t.string "pay_slip_1"
    t.string "pay_slip_2"
    t.string "pay_slip_3"
    t.string "tax_notice"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employer"
    t.string "seniority"
    t.string "employer_address"
    t.string "employer_phone_number"
    t.string "property_tax"
    t.index ["user_id"], name: "index_guarantors_on_user_id"
  end

  create_table "url_flats", force: :cascade do |t|
    t.text "url_1"
    t.text "url_2"
    t.text "url_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "flat_id"
    t.index ["flat_id"], name: "index_url_flats_on_flat_id"
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
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.string "mail"
    t.string "phone_number"
    t.string "work_situation"
    t.string "job_name"
    t.float "salary_by_month"
    t.date "first_day_of_work"
    t.string "rental_status"
    t.float "year_legal_income"
    t.float "actual_rent_price"
    t.date "birthday_date"
    t.string "employment_contract"
    t.string "identity_card"
    t.string "pay_slip_1"
    t.string "pay_slip_2"
    t.string "pay_slip_3"
    t.string "actual_rent_bill"
    t.string "tax_notice"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "candidatures", "users"
  add_foreign_key "flats", "agencies"
  add_foreign_key "guarantors", "users"
  add_foreign_key "url_flats", "flats"
end
