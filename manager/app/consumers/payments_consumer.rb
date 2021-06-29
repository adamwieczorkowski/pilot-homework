class PaymentsConsumer < ApplicationConsumer
  def consume
    send(params.payload["name"].to_sym)
  end

  def pending_payment_request_created
    CreatePaymentRequest.new(event_value).call
  end

  def payment_request_accepted; end

  def payment_request_rejected; end

  private

  def event_value
    params.payload.with_indifferent_access[:value]
  end
end
