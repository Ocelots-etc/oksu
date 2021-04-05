class Admin < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :users, through: :appointments

  validates_uniqueness_of :email, allow_blank: false
  validates :name, length: { minimum: 2 }, allow_blank: false
  validates_presence_of :name, :email

  def self.find_with_omniauth(auth)
    self.find_or_create_by(uid: auth[:uid]) do |o|
      o.name = auth[:info][:name]
      o.email = auth[:info][:email]
      # o.image = auth[:info][:image]
      o.password = SecureRandom.hex
    end
  end
end
