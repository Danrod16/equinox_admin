require "administrate/base_dashboard"

class BookingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    flat: Field::BelongsTo,
    user: Field::BelongsTo,
    tenant: Field::BelongsTo,
    deposit: Field::HasOne,
    receipts: Field::HasMany,
    invoices: Field::HasMany,
    id: Field::Number,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    deposit_registry: Field::String,
    # deposit_paid: Field::Boolean,
    contract_type: Field::Select.with_options(collection: ['Largo Plazo', 'Temporal', 'Otro']),
    # deposit_amount: Field::Number,
    rent: Field::Number.with_options(suffix: "€", decimals: 2),
    appliences: Field::Number.with_options(suffix: "€", decimals: 2),
    itp: Field::Number.with_options(suffix: "€", decimals: 2),
    agency_fee: Field::Number.with_options(suffix: "€", decimals: 2),
    payments: Field::Number,
    expiry_date: Field::DateTime,
    check_in_notes: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  flat
  user
  tenant
  deposit
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  flat
  user
  tenant
  deposit
  receipts
  invoices
  id
  start_date
  end_date
  deposit_registry
  contract_type
  rent
  appliences
  itp
  agency_fee
  payments
  expiry_date
  check_in_notes
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  flat
  user
  tenant
  deposit
  start_date
  end_date
  deposit_registry
  contract_type
  rent
  appliences
  itp
  agency_fee
  payments
  expiry_date
  check_in_notes
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how bookings are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(booking)
    "Reserva ##{booking.id}"
  end
end
