require "test_helper"

class TokenAuthTest < RequestTest
  setup do
    Info.authorize {|token| token == "abc" }
  end

  test "accepts valid credentials" do
    get "/application/info", {}, "HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Token.encode_credentials("abc")
    assert_equal 200, last_response.status
  end

  test "rejects invalid credentials" do
    get "/application/info"
    assert_equal 401, last_response.status
  end
end
