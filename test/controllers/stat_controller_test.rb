require 'test_helper'

class StatControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get stat_home_url
    assert_response :success
  end

  test "should get index" do
    get stat_index_url
    assert_response :success
  end

  test "should get import" do
    get stat_import_url
    assert_response :success
  end

end
