require "test_helper"

class AccesibilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get accesibilities_new_url
    assert_response :success
  end

  test "should get create" do
    get accesibilities_create_url
    assert_response :success
  end
end
