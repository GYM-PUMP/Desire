require 'test_helper'

class User::SupplementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_supplements_index_url
    assert_response :success
  end

  test "should get show" do
    get user_supplements_show_url
    assert_response :success
  end

end
