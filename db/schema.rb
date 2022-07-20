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

ActiveRecord::Schema.define(version: 2022_07_20_085746) do

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

  create_table "bookings", force: :cascade do |t|
    t.string "start_date"
    t.string "end_date"
    t.string "deposit_registry"
    t.boolean "deposit_paid"
    t.string "contract_type"
    t.integer "deposit_amount"
    t.integer "rent"
    t.integer "payments"
    t.text "check_in_notes"
    t.bigint "flat_id", null: false
    t.bigint "user_id", null: false
    t.bigint "tenant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", default: "Abierta"
    t.integer "obligatory_complience"
    t.float "appliences"
    t.float "agency_fee"
    t.float "itp"
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["tenant_id"], name: "index_bookings_on_tenant_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "validated", default: false
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

  create_table "flat_landlords", force: :cascade do |t|
    t.bigint "flat_id", null: false
    t.bigint "landlord_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flat_id"], name: "index_flat_landlords_on_flat_id"
    t.index ["landlord_id"], name: "index_flat_landlords_on_landlord_id"
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
    t.float "latitude"
    t.float "longitude"
    t.string "address"
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
    t.string "role", default: "User"
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "language", default: "en"
    t.bigint "company_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "tenants"
  add_foreign_key "bookings", "users", name: "fk_bookings_users"
  add_foreign_key "deposits", "bookings"
  add_foreign_key "flat_landlords", "flats"
  add_foreign_key "flat_landlords", "landlords"
  add_foreign_key "incidents", "bookings"
  add_foreign_key "incidents", "users"
  add_foreign_key "invoices", "bookings"
  add_foreign_key "receipts", "bookings"
  add_foreign_key "settlements", "bookings"
  add_foreign_key "users", "companies"
end
