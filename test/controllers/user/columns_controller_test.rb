require 'test_helper'

class User::ColumnsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_columns_index_url
    assert_response :success
  end

  test "should get show" do
    get user_columns_show_url
    assert_response :success
  end

end
