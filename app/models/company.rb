class Company < ApplicationRecord
  before_create :create_subdomain
  after_create :create_tenant
  has_many :users

  validates :name, uniqueness: true

  private

  def map_name
    self.name.gsub(" ", "").strip.downcase
  end

  def create_subdomain
    self.subdomain =  map_name
  end

  def create_tenant
    # self.update(subdomain: map_name)
    Apartment::Tenant.create(self.subdomain) # unless User.where(subdomain: self.subdomain).count > 1
  end
end
