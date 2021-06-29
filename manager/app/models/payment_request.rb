class PaymentRequest < ApplicationRecord
  PENDING_STATUS = "pending"
  ACCEPTED_STATUS = "accepted"
  REJECTED_STATUS = "rejected"
  STATUSES = [PENDING_STATUS, ACCEPTED_STATUS, REJECTED_STATUS].freeze
  AVAILABLE_CURRENCIES = %w[PLN EUR USD GBP CZK].freeze

  validates :amount, :currency, :description, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :currency, inclusion: { in: AVAILABLE_CURRENCIES }
end
