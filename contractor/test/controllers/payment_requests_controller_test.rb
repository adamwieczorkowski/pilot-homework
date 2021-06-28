require "test_helper"

class PaymentRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_requests_index_url
    assert_response :success
  end

  test "should get new" do
    get payment_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get payment_requests_create_url
    assert_response :success
  end
end
