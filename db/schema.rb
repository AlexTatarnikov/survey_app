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

ActiveRecord::Schema.define(version: 2018_10_12_001551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.integer "kind", default: 0, null: false
    t.boolean "required", default: false
    t.string "title", null: false
    t.string "placeholder"
    t.string "choices", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_questions_on_survey_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.json "answers", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["survey_id", "user_id"], name: "index_responses_on_survey_id_and_user_id", unique: true
    t.index ["survey_id"], name: "index_responses_on_survey_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_surveys_on_title", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "questions", "surveys"
  add_foreign_key "responses", "surveys"
  add_foreign_key "responses", "users"
end
