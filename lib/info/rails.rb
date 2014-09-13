require 'info'

Info.setup do
  add 'Rails', Rails.version
  add 'Database', ActiveRecord::Base.connection.adapter_name
  add 'SSL', -> r { r.ssl? }
  add 'Application Server', -> r { r.env['SERVER_SOFTWARE'] }
end
