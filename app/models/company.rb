class Company < ApplicationRecord
  CURRENCIES = ["EUR", "USD"]

  before_create :create_subdomain
  after_create :create_tenant
  has_many :users

  has_one_attached :logo

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :currency, inclusion: { in: CURRENCIES }

  private

  def map_name
    self.name.gsub(" ", "").strip.downcase
  end

  def create_subdomain
    self.subdomain = map_name
  end

  def create_tenant
    # self.update(subdomain: map_name)
    Apartment::Tenant.create(self.subdomain) # unless User.where(subdomain: self.subdomain).count > 1
    Apartment::Tenant.switch!(self.subdomain)
    ActiveRecord::Base.connection.exec_query("ALTER TABLE bookings DROP CONSTRAINT fk_bookings_users")
    ActiveRecord::Base.connection.exec_query("ALTER TABLE bookings ADD CONSTRAINT fk_bookings_users FOREIGN KEY (user_id) REFERENCES public.users (id);")
  end
end
