class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  scope :order_by_appt_datetime, ->{ order(appt_datetime: :asc) }

  validates :appt_datetime, date: {
    after: Proc.new { DateTime.now }, message: "must be in the future." },
    on: :create

    #Proc.new means an object is an encapsulation of a block of code
end

