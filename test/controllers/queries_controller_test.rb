require "test_helper"

class QueriesControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get queries_search_url
    assert_response :success
  end
end
