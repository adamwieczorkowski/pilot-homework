class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all
  end

  def accept
  end

  def reject
  end

  private
end
