require "test_helper"

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @auth_headers = {
      "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials("admin", "password")
    }
  end

  test "should get the calculator" do
    get root_path
    assert_response :success
  end

  test "can calculate tip" do
    post calculations_path params: { calculation: { bill: 20.3, tip: 10, people: 3 } }
    assert_response :found
  end

  test "can not calculate tip with invalid input data" do
    post calculations_path params: { calculation: { bill: 0, tip: 10, people: 3 } }
    assert_response :unprocessable_entity
  end

  test "can reset calculator form" do
    post calculations_path params: { commit: "RESET" }
    assert_redirected_to calculations_path
  end

  test "only admins should access past calculations" do
    get admin_dashboard_url, headers: @auth_headers
    assert_response :success
  end

  test "should not get past calculations if not admin" do
    get admin_dashboard_url
    assert_response :unauthorized
  end

  test "should not get past calculations with invalid admin credentials" do
    invalid_credentials = {
      "Authorization" => ActionController::HttpAuthentication::Basic.encode_credentials("wrong", "credentials")
    }
    get admin_dashboard_url, headers: invalid_credentials
    assert_response :unauthorized
  end
end
