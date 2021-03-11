class Admin < ApplicationRecord
  has_many :appointments
  has_many :users, through: :appointments

  validates_uniqueness_of :email, allow_blank: false
  validates :name, length: { minimum: 2 }, allow_blank: false
end
