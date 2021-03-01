require "administrate/base_dashboard"

class FlatDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    name: Field::String,
    landlord: Field::BelongsTo,
    bookings: Field::HasMany,
    available: Field::Boolean,
    id: Field::Number,
    address: Field::Text,
    celula: Field::String,
    catastral: Field::String,
    index: Field::Number,
    cee: Field::String,
    expenses: Field::Number,
    insurance: Field::String,
    insurance_phone: Field::String,
    keys: Field::Number,
    access_terace: Field::Boolean,
    equinox_costs: Field::Number,
    photos: Field::ActiveStorage.with_options(index_display_preview: true, show_display_preview: true),
    video: Field::String,
    furnished: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  name
  available
  landlord
  bookings
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  name
  landlord
  bookings
  available
  id
  address
  celula
  catastral
  index
  cee
  expenses
  insurance
  insurance_phone
  keys
  access_terace
  equinox_costs
  photos
  video
  furnished
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  name
  landlord
  available
  address
  celula
  catastral
  index
  cee
  expenses
  insurance
  insurance_phone
  keys
  access_terace
  equinox_costs
  photos
  video
  furnished
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

  # Overwrite this method to customize how flats are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(flat)
    "#{flat.name}"
  end

  def permitted_attributes
    super + [:photos => []]
  end
end
