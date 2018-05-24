require 'test_helper'

class SpacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spaces_index_url
    assert_response :success
  end

  test "should get show" do
    get spaces_show_url
    assert_response :success
  end

  test "should get new" do
    get spaces_new_url
    assert_response :success
  end

end
