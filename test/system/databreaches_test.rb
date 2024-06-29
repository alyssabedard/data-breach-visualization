require "application_system_test_case"

class DatabreachesTest < ApplicationSystemTestCase
  setup do
    @databreach = databreaches(:one)
  end

  test "visiting the index" do
    visit databreaches_url
    assert_selector "h1", text: "Databreaches"
  end

  test "should create databreach" do
    visit databreaches_url
    click_on "New databreach"

    click_on "Create Databreach"

    assert_text "Databreach was successfully created"
    click_on "Back"
  end

  test "should update Databreach" do
    visit databreach_url(@databreach)
    click_on "Edit this databreach", match: :first

    click_on "Update Databreach"

    assert_text "Databreach was successfully updated"
    click_on "Back"
  end

  test "should destroy Databreach" do
    visit databreach_url(@databreach)
    click_on "Destroy this databreach", match: :first

    assert_text "Databreach was successfully destroyed"
  end
end
