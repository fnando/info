require "info"

Info.setup do
  add "Rails Version", Rails.version
  add "Rails Environment", Rails.env
  add "Ruby Version", "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL} (#{RUBY_PLATFORM})"
  add "RubyGems Version", Gem::RubyGemsVersion
  add "Rack Version", ::Rack.release
  add "Bundler Version", ::Bundler::VERSION
  add "JavaScript Runtime", ExecJS.runtime.name rescue nil
  add "Database Adapter", ActiveRecord::Base.connection.adapter_name rescue nil
  add "SSL", -> r { r.ssl? }
  add "Application Server", -> r { r.env["SERVER_SOFTWARE"] }
end
