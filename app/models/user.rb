class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :incidents
  has_one_attached :photo


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
end
