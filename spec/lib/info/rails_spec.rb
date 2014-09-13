require 'spec_helper'

describe 'Rails info' do
  before do
    load 'info/rails.rb'
    require 'execjs'
  end

  let(:request) do
    double('request', ssl?: true, env: {'SERVER_SOFTWARE' => 'Unicorn 4.8.3'})
  end

  subject(:info) { Info.collect(request) }

  [
    'Rails Version',
    'Rails Environment',
    'Ruby Version',
    'RubyGems Version',
    'Rack Version',
    'Bundler Version',
    'JavaScript Runtime',
    'Database Adapter',
    'SSL',
    'Application Server',
  ].each do |key|
    it { expect(info).to have_key(key) }
  end
end
