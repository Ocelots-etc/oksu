class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :admin, optional: true
end

