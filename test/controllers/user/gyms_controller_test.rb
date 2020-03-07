require 'test_helper'

class User::GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get user_gyms_show_url
    assert_response :success
  end

end
