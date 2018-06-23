class Ticket < ApplicationRecord
  validates :email, presence: true
end
