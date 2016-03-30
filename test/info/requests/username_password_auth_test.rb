require "test_helper"

class UsernamePasswordAuthTest < RequestTest
  setup do
    Info.authorize {|username, password| username == "john" && password == "test" }
  end

  test "accepts valid credentials" do
    get "/application/info", {}, "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials("john", "test")
    assert_equal 200, last_response.status
  end

  test "rejects invalid credentials" do
    get "/application/info"
    assert_equal 401, last_response.status
  end
end
