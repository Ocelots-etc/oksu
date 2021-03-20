class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :admins, through: :appointments
  has_one :toolkit
  

  validates_uniqueness_of :email, allow_blank: false
  validates :name, length: { minimum: 2 }, allow_blank: false
end
