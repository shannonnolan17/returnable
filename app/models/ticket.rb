class Ticket < ApplicationRecord
  validates   :subject, :description, :email, :status, :priority, presence: true
end
