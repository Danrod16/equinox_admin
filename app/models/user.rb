class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :incidents
  has_one_attached :photo

  # before_create :create_subdomain
  after_create :create_tenant

  def agent?
    self.role == "Agente"
  end

  def admin?
    self.role == "Administrador"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def table_attribute
    return self.full_name
  end

  private

  def map_company_name
    self.company_name.gsub(" ", "").strip.downcase
  end

  # def create_subdomain
  #   self.update(subdomain: map_company_name)
  # end

  def create_tenant
    self.update(subdomain: map_company_name)
    Apartment::Tenant.create(self.subdomain) # unless User.where.not(id: self.id).pluck(:subdomain).include? self.subdomain
  end
end
