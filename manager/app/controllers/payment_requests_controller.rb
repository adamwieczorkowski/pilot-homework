class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all.sort_by do |pr|
      PaymentRequest::STATUSES.index(pr.status)
    end
  end

  def accept
    payment_request.update(status: PaymentRequest::ACCEPTED_STATUS)
    redirect_to action: :index
  end

  def reject
    payment_request.update(status: PaymentRequest::REJECTED_STATUS)
    redirect_to action: :index
  end

  private

  def payment_request
    @payment_request ||= PaymentRequest.find(params[:id])
  end
end
