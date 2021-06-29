class RejectPaymentRequest
  def initialize(payment_params)
    @payment_params = payment_params
  end

  def call
    payment_request.update(status: PaymentRequest::REJECTED_STATUS)
  end

  private

  attr_reader :payment_params

  def payment_request
    PaymentRequest.find(payment_params[:id])
  end
end
