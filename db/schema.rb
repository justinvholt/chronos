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


ActiveRecord::Schema.define(version: 2018_12_05_215842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cargo_handlings", force: :cascade do |t|
    t.bigint "fixture_cargo_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_cargo_handlings_on_event_id"
    t.index ["fixture_cargo_id"], name: "index_cargo_handlings_on_fixture_cargo_id"
  end

  create_table "clause_groups", force: :cascade do |t|
    t.bigint "clause_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["clause_id"], name: "index_clause_groups_on_clause_id"
  end

  create_table "clauses", force: :cascade do |t|
    t.string "title"
    t.string "paragraph"
    t.text "wording"
    t.string "bloc"
    t.string "proc_service"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cp_form"
    t.string "parent_relation"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "datetime"
    t.string "port"
    t.string "terminal"
    t.string "berth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vessel_name"
    t.integer "voyage_number"
    t.string "counting"
    t.jsonb "laytime"
  end

  create_table "fixture_cargos", force: :cascade do |t|
    t.string "name"
    t.integer "quantity_mts"
    t.bigint "fixture_id"
    t.string "load_port"
    t.string "load_terminal"
    t.string "load_berth"
    t.string "disch_port"
    t.string "disch_terminal"
    t.string "disch_berth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "obl"
    t.index ["fixture_id"], name: "index_fixture_cargos_on_fixture_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.string "reference_no"
    t.string "charterer"
    t.string "vessel_name"
    t.integer "voyage_number"
    t.float "demurrage_rate"
    t.integer "allowed_laytime"
    t.bigint "clause_group_id"
    t.integer "laytime_used"
    t.float "total_demurrage"
    t.string "calculation_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clause_group_id"], name: "index_fixtures_on_clause_group_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cargo_handlings", "events"
  add_foreign_key "cargo_handlings", "fixture_cargos"
  add_foreign_key "clause_groups", "clauses"
  add_foreign_key "fixture_cargos", "fixtures"
  add_foreign_key "fixtures", "clause_groups"
end
