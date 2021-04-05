class Toolkit < ApplicationRecord
  belongs_to :user

  validates_presence_of :documents, :legal

end
