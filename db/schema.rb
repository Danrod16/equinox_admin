# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_15_090352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "deposit_registry"
    t.boolean "deposit_paid"
    t.string "contract_type"
    t.integer "deposit_amount"
    t.integer "rent"
    t.integer "agency_fee"
    t.integer "payments"
    t.string "expiry_date"
    t.text "check_in_notes"
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "appliences"
    t.string "state", default: "Abierta"
    t.integer "obligatory_complience"
    t.boolean "notified", default: false
    t.float "itp"
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["tenant_id"], name: "index_bookings_on_tenant_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "custom_invoices", force: :cascade do |t|
    t.string "client"
    t.string "address"
    t.string "nif"
    t.string "title"
    t.integer "sequence", default: 1
    t.float "total_cost"
    t.float "agency_fee"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "state"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "token_payment"
    t.index ["booking_id"], name: "index_deposits_on_booking_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "celula"
    t.string "catastral"
    t.integer "index"
    t.string "cee"
    t.integer "expenses"
    t.string "insurance"
    t.string "insurance_phone"
    t.integer "keys"
    t.integer "equinox_costs"
    t.string "photos"
    t.string "video"
    t.boolean "furnished"
    t.bigint "landlord_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "available"
    t.string "name"
    t.string "reference"
    t.string "street"
    t.string "number"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.boolean "letter_box"
    t.integer "reference_rent"
    t.string "habitability_number"
    t.string "catastral_number"
    t.index ["landlord_id"], name: "index_flats_on_landlord_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.string "state"
    t.string "title"
    t.text "description"
    t.string "photo"
    t.float "total_cost"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_hours"
    t.float "hourly_fee"
    t.integer "sequence", default: 1
    t.index ["booking_id"], name: "index_incidents_on_booking_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "state"
    t.string "expirry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "fianza"
    t.float "total"
    t.integer "sequence", default: 1
    t.float "supplements"
    t.index ["booking_id"], name: "index_invoices_on_booking_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "email"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "id_number"
    t.string "id_type"
    t.string "cif"
    t.string "street"
    t.string "number"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "nationality"
    t.string "company_name"
    t.string "phone"
    t.string "iban"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_receipts_on_booking_id"
  end

  create_table "settlements", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_settlements_on_booking_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street"
    t.string "street_2"
    t.string "number"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "id_number"
    t.string "id_type"
    t.string "cif"
    t.string "nationality"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role", default: "Agente"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "tenants"
  add_foreign_key "bookings", "users"
  add_foreign_key "deposits", "bookings"
  add_foreign_key "flats", "landlords"
  add_foreign_key "incidents", "bookings"
  add_foreign_key "incidents", "users"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "receipts", "bookings"
  add_foreign_key "settlements", "bookings"
end
