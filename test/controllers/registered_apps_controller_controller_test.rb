require 'test_helper'

class RegisteredAppsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get registered_apps_controller_index_url
    assert_response :success
  end

  test "should get show" do
    get registered_apps_controller_show_url
    assert_response :success
  end

  test "should get new" do
    get registered_apps_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get registered_apps_controller_create_url
    assert_response :success
  end

end
