# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  require 'faker'
  puts "destroying data"
  Flat.destroy_all
  Landlord.destroy_all
  Tenant.destroy_all
  puts "Creating Data"
  15.times do
    landlord = Landlord.create!(
      first_name: Faker::Name.name,
      last_name: Faker::FunnyName.name,
      email: Faker::Internet.email,
      id_number: 123123123,
      id_type: Landlord::ID.sample,
      cif: 123123123,
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      postal_code: Faker::Address.zip_code,
      city: Faker::Address.city,
      country: Faker::Address.country,
      nationality: Faker::Address.country,
      company_name: Faker::Company.name,
      phone: Faker::PhoneNumber.phone_number,
      iban: Faker::Bank.iban(country_code: "es")
      )

    flat = Flat.create!(
      celula: Faker::Bank.account_number,
      catastral: Faker::Bank.swift_bic,
      index: 1500,
      cee: Faker::Bank.swift_bic,
      expenses: 200,
      insurance: "#{Faker::Company.name} insurrance",
      insurance_phone: Faker::PhoneNumber.phone_number,
      keys: rand(1..3),
      equinox_costs: rand(100..500),
      furnished: true,
      landlord: landlord,
      available: true,
      name: Faker::Address.street_name,
      reference: Faker::Address.street_name,
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      postal_code: Faker::Address.zip_code,
      city: Faker::Address.city,
      country: Faker::Address.country,
      )

    tenant = Tenant.create!(
      first_name: Faker::Name.name,
      last_name: Faker::FunnyName.name,
      email: Faker::Internet.email,
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      postal_code: Faker::Address.zip_code,
      city: Faker::Address.city,
      country: Faker::Address.country,
      nationality: Faker::Address.country,
      cif: 123123123
      )
    puts "tenant #{tenant.first_name} created"
    puts "landlord #{landlord.first_name} created"
    puts "flat #{flat.name} created"

  end
  puts "done!"

  #  create_table "tenants", force: :cascade do |t|
 #    t.string "first_name"
 #    t.string "last_name"
 #    t.string "email"
 #    t.string "phone"
 #    t.text "description"
 #    t.string "photo"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.string "street"
 #    t.string "street_2"
 #    t.string "number"
 #    t.string "postal_code"
 #    t.string "city"
 #    t.string "country"
 #    t.string "id_number"
 #    t.string "id_type"
 #    t.string "cif"
 #    t.string "nationality"
 #  end

 # create_table "custom_invoices", force: :cascade do |t|
 #    t.string "client"
 #    t.string "address"
 #    t.string "nif"
 #    t.string "title"
 #    t.integer "sequence", default: 1
 #    t.float "total_cost"
 #    t.float "agency_fee"
 #    t.text "description"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #  end

 #  create_table "deposits", force: :cascade do |t|
 #    t.bigint "booking_id", null: false
 #    t.string "state"
 #    t.integer "amount"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.float "token_payment"
 #    t.index ["booking_id"], name: "index_deposits_on_booking_id"
 #  end

 #  create_table "incidents", force: :cascade do |t|
 #    t.bigint "booking_id", null: false
 #    t.bigint "user_id", null: false
 #    t.string "state"
 #    t.string "title"
 #    t.text "description"
 #    t.string "photo"
 #    t.float "total_cost"
 #    t.text "notes"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.integer "total_hours"
 #    t.float "hourly_fee"
 #    t.integer "sequence", default: 1
 #    t.index ["booking_id"], name: "index_incidents_on_booking_id"
 #    t.index ["user_id"], name: "index_incidents_on_user_id"
 #  end

 #  create_table "invoices", force: :cascade do |t|
 #    t.bigint "booking_id", null: false
 #    t.string "state"
 #    t.string "expirry_date"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.float "fianza"
 #    t.float "total"
 #    t.integer "sequence", default: 1
 #    t.float "supplements"
 #    t.index ["booking_id"], name: "index_invoices_on_booking_id"
 #  end


 #  create_table "receipts", force: :cascade do |t|
 #    t.bigint "booking_id", null: false
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.index ["booking_id"], name: "index_receipts_on_booking_id"
 #  end

 #  create_table "settlements", force: :cascade do |t|
 #    t.bigint "booking_id", null: false
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.index ["booking_id"], name: "index_settlements_on_booking_id"
 #  end



 #  create_table "users", force: :cascade do |t|
 #    t.string "email", default: "", null: false
 #    t.string "encrypted_password", default: "", null: false
 #    t.string "reset_password_token"
 #    t.datetime "reset_password_sent_at"
 #    t.datetime "remember_created_at"
 #    t.datetime "created_at", precision: 6, null: false
 #    t.datetime "updated_at", precision: 6, null: false
 #    t.string "role", default: "Agente"
 #    t.string "first_name"
 #    t.string "last_name"
 #    t.string "photo"
 #    t.index ["email"], name: "index_users_on_email", unique: true
 #    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
 #  end
