class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :bookings, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_one_attached :photo
  belongs_to :company

  before_create :update_admin

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

  def update_admin
    if User.where(company: self.company).count == 0
      self.role = "Admin"
      self.skip_confirmation!
    end
  end
end
