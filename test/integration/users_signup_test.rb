require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
  	get signup_path							# Get not needed, just a double check and conceptual clarity
  	assert_select 'form[action="/signup"]'  # test for 7.3 ex 4
  	assert_no_difference 'User.count' do	# This is equivalent to recording the user count, 
  		post users_path, params: { user: { name: "",		# posting the data, 
  										   email: "user@invalid",
  										   password: 				"foo",
  										   password_confirmation: 	"bar" } }
  		end																	#and verifying that the count is the same
  	assert_template 'users/new'
  	assert_select 'div#error_explanation'
  	assert_select 'div.alert'

  end
end
