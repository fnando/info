require "forwardable"

require "info/version"
require "info/engine"
require "info/configuration"

module Info
  class << self
    extend Forwardable

    def_delegators :configuration,
      :enabled?, :collect, :add, :enable!, :disable!, :authorize, :collectors
  end

  def self.setup(&block)
    configuration.instance_eval(&block)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
