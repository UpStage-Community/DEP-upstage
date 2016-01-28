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

ActiveRecord::Schema.define(version: 20151228052955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "phone",              limit: 8
    t.string   "email"
    t.string   "url"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "company_members", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer  "production_id"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "production_members", force: :cascade do |t|
    t.integer  "production_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "productions", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "description"
    t.string   "price_range"
    t.string   "ticket_url"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "performance_id"
    t.integer  "value"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",           null: false
    t.string   "uid",                null: false
    t.string   "name"
    t.string   "handle"
    t.string   "image_url"
    t.string   "url"
    t.text     "bio"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "feedback_id"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
