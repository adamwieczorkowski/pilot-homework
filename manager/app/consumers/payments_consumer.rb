class PaymentsConsumer < ApplicationConsumer
  def consume
    send(params["name"].to_sym)
  end

  def pending_payment_request_created
  end

  private

  def event_value
    params.with_indifferent_access[:value]
  end
end
