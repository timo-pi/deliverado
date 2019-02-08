require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get deliveries_create_url
    assert_response :success
  end

end
