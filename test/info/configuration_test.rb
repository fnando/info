require "test_helper"

class ConfigurationTest < Minitest::Test
  let(:config) { Info::Configuration.new }

  test "enables collection" do
    config.disable!
    config.enable!

    assert config.enabled?
  end

  test "disables collection" do
    config.enable!
    config.disable!

    refute config.enabled?
  end

  test "sets authorization" do
    config.authorize {}

    assert_instance_of Proc, config.authorizer
  end

  test "adds collector" do
    config.add "key", "value"

    collectors = config.collectors
    collector = collectors.first

    assert_equal 1, config.collectors.size
    assert_equal "key", collector.fetch(:name)
    assert_equal "value", collector.fetch(:value)
  end

  test "collects primitive values" do
    config.add "name", "myapp"
    assert_equal "myapp", config.collect.fetch("name")
  end

  test "collects value from callable objects (arity=0)" do
    config.add "name", -> { "myapp" }
    assert_equal "myapp", config.collect.fetch("name")
  end

  test "collects value from callable objects (arity=1)" do
    request = OpenStruct.new(name: "myapp")
    config.add "name", -> r { r.name }

    assert_equal "myapp", config.collect(request).fetch("name")
  end
end
