require "event_bus"

class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all.sort_by do |pr|
      PaymentRequest::STATUSES.index(pr.status)
    end
  end

  def accept
    if payment_request.update(status: PaymentRequest::ACCEPTED_STATUS)
      emit_payment_status_updated_event(PaymentRequest::ACCEPTED_STATUS)
      redirect_to action: :index
    end
  end

  def reject
    if payment_request.update(status: PaymentRequest::REJECTED_STATUS)
      emit_payment_status_updated_event(PaymentRequest::REJECTED_STATUS)
      redirect_to action: :index
    end
  end

  private

  def payment_request
    @payment_request ||= PaymentRequest.find(params[:id])
  end

  def emit_payment_status_updated_event(payment_status)
    emit_event(
      "EventBus::PAYMENT_REQUEST_#{payment_status}_EVENT".constantize,
      payment_request,
      EventBus::PAYMENTS_TOPIC
    )
  end
end
