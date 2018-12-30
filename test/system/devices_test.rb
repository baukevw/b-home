require "application_system_test_case"

class DevicesTest < ApplicationSystemTestCase
  setup do
    @device = devices(:one)
  end

  test "visiting the index" do
    visit devices_url
    assert_selector "h1", text: "Devices"
  end

  test "creating a Device" do
    visit devices_url
    click_on "New Device"

    fill_in "Api expected response", with: @device.api_expected_response
    fill_in "Api request actions", with: @device.api_request_actions
    fill_in "Api request body", with: @device.api_request_body
    fill_in "Api request headers", with: @device.api_request_headers
    fill_in "Api request type", with: @device.api_request_type
    fill_in "Api url", with: @device.api_url
    fill_in "Icon", with: @device.icon
    fill_in "Name", with: @device.name
    click_on "Create Device"

    assert_text "Device was successfully created"
    click_on "Back"
  end

  test "updating a Device" do
    visit devices_url
    click_on "Edit", match: :first

    fill_in "Api expected response", with: @device.api_expected_response
    fill_in "Api request actions", with: @device.api_request_actions
    fill_in "Api request body", with: @device.api_request_body
    fill_in "Api request headers", with: @device.api_request_headers
    fill_in "Api request type", with: @device.api_request_type
    fill_in "Api url", with: @device.api_url
    fill_in "Icon", with: @device.icon
    fill_in "Name", with: @device.name
    click_on "Update Device"

    assert_text "Device was successfully updated"
    click_on "Back"
  end

  test "destroying a Device" do
    visit devices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Device was successfully destroyed"
  end
end
