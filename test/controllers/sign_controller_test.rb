require 'test_helper'

class SignControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get sign_signup_url
    assert_response :success
  end

  test "should get signin" do
    get sign_signin_url
    assert_response :success
  end

end
