require 'test_helper'

class DeliveryControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get delivery_update_url
    assert_response :success
  end

end
