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

ActiveRecord::Schema.define(version: 2021_02_10_154326) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "deposit_registry"
    t.boolean "deposit_paid"
    t.string "contract_type"
    t.integer "deposit_amount"
    t.integer "rent"
    t.string "appliencies"
    t.string "itp"
    t.integer "agency_fee"
    t.integer "payments"
    t.string "expiry_date"
    t.text "check_in_notes"
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["tenant_id"], name: "index_bookings_on_tenant_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "state"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_deposits_on_booking_id"
  end

  create_table "flats", force: :cascade do |t|
    t.text "address"
    t.string "celula"
    t.string "catastral"
    t.integer "index"
    t.string "cee"
    t.integer "expenses"
    t.string "insurance"
    t.string "insurance_phone"
    t.integer "keys"
    t.boolean "access_terace"
    t.integer "equinox_costs"
    t.string "photos"
    t.string "video"
    t.boolean "furnished"
    t.bigint "landlord_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landlord_id"], name: "index_flats_on_landlord_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.bigint "user_id", null: false
    t.string "state"
    t.string "title"
    t.text "description"
    t.string "photo"
    t.text "rules"
    t.integer "total_cost"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_incidents_on_booking_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.string "state"
    t.string "expirry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_invoices_on_booking_id"
  end

  create_table "landlords", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "email"
    t.string "dni"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_receipts_on_booking_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.text "description"
    t.string "dni"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "tenants"
  add_foreign_key "bookings", "users"
  add_foreign_key "deposits", "bookings"
  add_foreign_key "flats", "landlords"
  add_foreign_key "incidents", "bookings"
  add_foreign_key "incidents", "users"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "receipts", "bookings"
end
