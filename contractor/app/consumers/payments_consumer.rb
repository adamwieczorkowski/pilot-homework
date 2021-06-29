class PaymentsConsumer < ApplicationConsumer
  def consume
    send(params["name"].to_sym)
  end

  def payment_request_accepted
  end

  def payment_request_rejected
  end

  private

  def event_value
    params.with_indifferent_access[:value]
  end
end
