class User < ApplicationRecord
  has_many :appointments
  has_many :admins, through: :appointments

  validates_uniqueness_of :email, allow_blank: false
  validates :name, length: { minimum: 2 }, allow_blank: false
end
