class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :incidents
  
  def agent?
    self.role == "Agente"
  end

  def admin?
    self.role == "Administrador"
  end
end
