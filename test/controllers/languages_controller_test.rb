require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get switch_locale" do
    get languages_switch_locale_url
    assert_response :success
  end
end
