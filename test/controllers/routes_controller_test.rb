require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get start_address" do
    get routes_start_address_url
    assert_response :success
  end

  test "should get end_address" do
    get routes_end_address_url
    assert_response :success
  end

  test "should get delivery_radius" do
    get routes_delivery_radius_url
    assert_response :success
  end

end
