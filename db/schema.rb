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

ActiveRecord::Schema.define(version: 2021_12_21_174202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "text", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone_number"
    t.string "skype"
    t.string "telegram"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gradings", force: :cascade do |t|
    t.integer "criterion", null: false
    t.integer "mark", limit: 2, null: false
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_conditions", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", default: "", null: false
    t.integer "status", default: 0, null: false
    t.integer "views_number", default: 0, null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_regions", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "region_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_requirements_phrases", force: :cascade do |t|
    t.integer "project_id"
    t.integer "requirements_phrase_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects_spheres", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.integer "sphere_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "requirements_phrases", force: :cascade do |t|
    t.string "requirement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "purpose", limit: 2
  end

  create_table "spheres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sponsor_conditions", force: :cascade do |t|
    t.integer "sponsor_proposal_id", null: false
    t.integer "requirements_phrase_id", null: false
    t.string "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sponsor_proposals", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_settings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "entity_id", null: false
    t.string "entity_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "nick", default: "", null: false
    t.string "email", null: false
    t.string "about_me", default: "", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "gradings", "projects"
  add_foreign_key "gradings", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "sponsor_conditions", "requirements_phrases"
  add_foreign_key "sponsor_conditions", "sponsor_proposals"
  add_foreign_key "sponsor_proposals", "projects"
  add_foreign_key "sponsor_proposals", "users"
  add_foreign_key "user_settings", "users"
end
