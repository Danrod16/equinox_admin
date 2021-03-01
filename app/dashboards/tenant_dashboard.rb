require "administrate/base_dashboard"

class TenantDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    bookings: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    phone: Field::String,
    street: Field::String,
    street_2: Field::String,
    number: Field::String,
    postal_code: Field::String,
    city: Field::String,
    country: Field::String,
    description: Field::Text,
    dni: Field::String,
    photo: Field::ActiveStorage.with_options(index_display_preview: true),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  bookings
  id
  first_name
  last_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  bookings
  id
  first_name
  last_name
  email
  dni
  phone
  street
  street_2
  number
  postal_code
  city
  country
  description
  photo
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  first_name
  last_name
  email
  phone
  street
  street_2
  number
  postal_code
  city
  country
  description
  dni
  photo
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

  # Overwrite this method to customize how tenants are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(tenant)
    "#{tenant.first_name} #{tenant.last_name}"
  end
end
