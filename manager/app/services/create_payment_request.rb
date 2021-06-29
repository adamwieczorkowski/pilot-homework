class CreatePaymentRequest
  def initialize(payment_params)
    @payment_params = payment_params
  end

  def call
    PaymentRequest.create(create_params)
  end

  private

  def create_params
    payment_params.slice(:id, :amount, :currency, :description, :status)
  end

  attr_reader :payment_params
end
