require './lib/info/version'

Gem::Specification.new do |s|
  s.name        = 'info'
  s.version     = Info::VERSION
  s.authors     = ['Nando Vieira']
  s.email       = ['fnando.vieira@gmail.com']
  s.homepage    = 'http://github.com/fnando/info'
  s.summary     = 'A JSON endpoint with your Rails application info'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'pry-meta'
end
