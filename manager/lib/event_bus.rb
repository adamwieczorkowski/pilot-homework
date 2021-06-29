module EventBus
  PAYMENTS_TOPIC = "payments"

  PAYMENT_REQUEST_ACCEPTED_EVENT = "payment_request_accepted"
  PAYMENT_REQUEST_REJECTED_EVENT = "payment_request_rejected"

  def emit_event(event_name, data, topic)
    event_message = {
      name: event_name, timestamp: Time.now.to_i, value: data
    }.to_json
    WaterDrop::AsyncProducer.call(event_message, topic: topic)
  end
end
