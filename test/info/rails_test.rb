require "test_helper"

class RailsTest < Minitest::Test
  setup do
    load "info/rails.rb"
    require "execjs"
  end

  let(:request) {
    mock(ssl?: true, env: {"SERVER_SOFTWARE" => "Unicorn 4.8.3"})
  }

  let(:info) { Info.collect(request) }

  [
    "Rails Version",
    "Rails Environment",
    "Ruby Version",
    "RubyGems Version",
    "Rack Version",
    "Bundler Version",
    "JavaScript Runtime",
    "Database Adapter",
    "SSL",
    "Application Server",
  ].each do |key|
    test "collect #{key}" do
      assert info.key?(key)
    end
  end

  test "returns JS runtime" do
    assert_equal ExecJS.runtime.name, info.fetch("JavaScript Runtime")
  end
end
