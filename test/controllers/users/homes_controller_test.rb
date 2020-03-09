require 'test_helper'

class Users::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get users_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get users_homes_about_url
    assert_response :success
  end

  test "should get privacy" do
    get users_homes_privacy_url
    assert_response :success
  end

  test "should get contact" do
    get users_homes_contact_url
    assert_response :success
  end

  test "should get tos" do
    get users_homes_tos_url
    assert_response :success
  end

end
