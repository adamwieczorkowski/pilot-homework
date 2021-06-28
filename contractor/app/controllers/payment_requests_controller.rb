class PaymentRequestsController < ApplicationController
  def index
    @payment_requests = PaymentRequest.all
  end

  def new
    @payment_request = PaymentRequest.new
  end

  def create
    payment_request = PaymentRequest.create(create_params)
    if payment_request.valid?
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
end
