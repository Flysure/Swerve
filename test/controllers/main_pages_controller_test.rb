require 'test_helper'

class MainPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get map" do
    get main_pages_map_url
    assert_response :success
  end

end
