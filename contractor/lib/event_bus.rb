module EventBus
  PAYMENTS_TOPIC = "payments"

  PENDING_PAYMENT_REQUEST_CREATED_EVENT = "pending_payment_request_created"

  def emit_event(event_name, data, topic)
    event_message = {
      name: event_name, timestamp: Time.now.to_i, value: data
    }.to_json
    WaterDrop::AsyncProducer.call(event_message, topic: topic)
  end
end
