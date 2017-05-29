require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "As a non registered user, I'm able to signup" do
    request.headers.merge!(@auth_headers)
    get :index, format: :json
        
            assert_response :success
  end

end
