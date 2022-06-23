class Company < ApplicationRecord
  before_create :create_subdomain
  after_create :create_tenant
  has_many :users

  validates :company_name, uniqueness: true

  private

  def map_company_name
    self.company_name.gsub(" ", "").strip.downcase
  end

  def create_subdomain
    self.subdomain =  map_company_name
  end

  def create_tenant
    # self.update(subdomain: map_company_name)
    Apartment::Tenant.create(self.subdomain) # unless User.where(subdomain: self.subdomain).count > 1
  end
end
