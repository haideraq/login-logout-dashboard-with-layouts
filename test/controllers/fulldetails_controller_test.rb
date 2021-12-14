require "test_helper"

class FulldetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fulldetails_index_url
    assert_response :success
  end
end
