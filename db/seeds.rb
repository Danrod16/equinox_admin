# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  require 'faker'
  puts "destroying data"
  FlatLandlord.destroy_all
  Flat.destroy_all
  Landlord.destroy_all
  Tenant.destroy_all
  User.destroy_all
  Company.destroy_all
  Apartment::Tenant.drop('equinox')

  puts "Creating Data"

  admin = User.new(
    first_name: "admin",
    last_name: "admin",
    email: "admin@avenist.com",
    password: "123123",
    role: "Admin"
  )

  equinox = Company.create(
    name: "Equinox",
    subdomain: "equinox",
    validated: true,
    currency: "EUR"
  )
  admin.company = equinox
  admin.save


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
      available: true,
      name: Faker::Address.street_name,
      reference: Faker::Address.street_name,
      street: Faker::Address.street_name,
      number: Faker::Address.building_number,
      postal_code: Faker::Address.zip_code,
      city: Faker::Address.city,
      country: Faker::Address.country,
      )

    flat_landlord = FlatLandlord.create!(
      landlord: landlord,
      flat: flat
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