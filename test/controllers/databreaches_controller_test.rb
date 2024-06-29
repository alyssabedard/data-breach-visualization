require "test_helper"

class DatabreachesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @databreach = databreaches(:one)
  end

  test "should get index" do
    get databreaches_url
    assert_response :success
  end

  test "should get new" do
    get new_databreach_url
    assert_response :success
  end

  test "should create databreach" do
    assert_difference("Databreach.count") do
      post databreaches_url, params: { databreach: {  } }
    end

    assert_redirected_to databreach_url(Databreach.last)
  end

  test "should show databreach" do
    get databreach_url(@databreach)
    assert_response :success
  end

  test "should get edit" do
    get edit_databreach_url(@databreach)
    assert_response :success
  end

  test "should update databreach" do
    patch databreach_url(@databreach), params: { databreach: {  } }
    assert_redirected_to databreach_url(@databreach)
  end

  test "should destroy databreach" do
    assert_difference("Databreach.count", -1) do
      delete databreach_url(@databreach)
    end

    assert_redirected_to databreaches_url
  end
end
