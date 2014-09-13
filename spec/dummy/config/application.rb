require File.expand_path('../boot', __FILE__)

require 'rails/all'
I18n.enforce_available_locales = false

Bundler.require(:default, :test)
require "info"

module Dummy
  class Application < Rails::Application
    config.active_support.deprecation = :log
    config.secret_key_base = "bbf30e5586a2eb214151c23490dc3f701e9317690e01bbd1f0ba60651dabe2bcbf8ac9ebf2765d43283c6d90b72500a9a9d89b93ebbdccc7ec2e16841ebf6288"
    config.secret_token = config.secret_key_base
    config.eager_load = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end

