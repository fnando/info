require "test_helper"

class RubygemsTest < Minitest::Test
  test "collects rubygems info" do
    gemspec = OpenStruct.new(name: 'mygem', version: '0.1.0')
    Gem.stubs(:loaded_specs).returns(mygem: gemspec)
    load "info/rubygems.rb"

    info = Info.collect

    assert_includes info.fetch("Rubygems"), name: "mygem", version: "0.1.0"
  end
end
