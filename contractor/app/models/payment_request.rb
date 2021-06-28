class PaymentRequest < ApplicationRecord
  DEFAULT_STATUS = "pending"
  STATUSES = %w[pending accepted rejected].freeze
  AVAILABLE_CURRENCIES = %w[PLN EUR USD GBP CZK].freeze

  validates :amount, :currency, :description, :status, presence: true
  validates :status, inclusion: { in: STATUSES }
  validates :currency, inclusion: { in: AVAILABLE_CURRENCIES }
end
