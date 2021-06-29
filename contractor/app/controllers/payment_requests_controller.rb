require "event_bus"

class PaymentRequestsController < ApplicationController
  include EventBus

  def index
    @payment_requests = PaymentRequest.all
  end

  def new
    @payment_request = PaymentRequest.new
  end

  def create
    payment_request = PaymentRequest.create(create_params)
    if payment_request.persisted?
      emit_payment_created_event(payment_request)
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  private

  def create_params
    params.require(:payment_request).permit(
      :amount, :currency, :description, :status
    ).merge(status: PaymentRequest::DEFAULT_STATUS)
  end

  def emit_payment_created_event(payment_request)
    emit_event(
      EventBus::PENDING_PAYMENT_REQUEST_CREATED_EVENT,
      payment_request,
      EventBus::PAYMENTS_TOPIC
    )
  end
end
