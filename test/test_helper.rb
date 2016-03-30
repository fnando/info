ENV['RAILS_ENV'] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
# require "rails/test_help"
require "minitest"
require "minitest/autorun"
require "minitest/utils"
require "mocha/mini_test"

Rails.backtrace_cleaner.remove_silencers!

module Minitest
  class Test
    setup do
      Info.collectors.clear
      Info.configuration.authorizer = nil
      Info.enable!
    end
  end
end

class RequestTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Rails.application
  end
end
