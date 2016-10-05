require 'test_helper'

class ToolsControllerTest < ActionDispatch::IntegrationTest
  test "should get public" do
    get tools_public_url
    assert_response :success
  end

  test "should get private" do
    get tools_private_url
    assert_response :success
  end

end
