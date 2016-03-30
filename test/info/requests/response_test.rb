require "test_helper"

class ResponseTest < RequestTest
  test "returns JSON" do
    get "/application/info"

    assert_includes last_response.content_type, "application/json"
  end

  test "returns collected information" do
    Info.add "name", "myapp"
    get "/application/info"
    payload = JSON.load(last_response.body)

    assert_equal "myapp", payload.fetch("name")
  end
end
