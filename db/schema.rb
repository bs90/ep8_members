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

ActiveRecord::Schema[7.1].define(version: 2024_05_27_052921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "progoses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date_test", null: false
    t.integer "range", null: false
    t.text "range_evaluation"
    t.integer "accuracy", null: false
    t.text "accuracy_evaluation"
    t.integer "fluency", null: false
    t.text "fluency_evaluation"
    t.integer "interaction", null: false
    t.text "interaction_evaluation"
    t.integer "coherence", null: false
    t.text "coherence_evaluation"
    t.integer "phonology", null: false
    t.text "phonology_evaluation"
    t.integer "overall", null: false
    t.text "overall_evaluation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_progoses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name_roma", limit: 30
    t.string "name_kata", limit: 50
    t.string "email", limit: 255, null: false
    t.date "date_of_birth"
    t.string "address", limit: 255
    t.integer "original_role"
    t.integer "training_role"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "progoses", "users"
end
