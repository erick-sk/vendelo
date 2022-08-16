require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:erick)
  end
  test 'show profile user' do
    get user_url(@user.username)

    assert_response :success
  end
end