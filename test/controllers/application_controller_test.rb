require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "should redirect to home path on 404 errors" do
    get store_path(1)
    assert_redirected_to home_path
  end

end