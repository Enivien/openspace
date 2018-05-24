require 'test_helper'

class RepliesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get replies_new_url
    assert_response :success
  end

end
