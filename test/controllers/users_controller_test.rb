require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path #changed from get users_new_url ## because the route name was changed
    assert_response :success
  end

end
