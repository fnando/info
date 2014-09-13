require 'spec_helper'

describe 'Rails info' do
  before { load 'info/rails.rb' }
  let(:request) {
    double('request', ssl?: true, env: {'SERVER_SOFTWARE' => 'Unicorn 4.8.3'})
  }
  subject(:info) { Info.collect(request) }

  it { expect(info).to include('Rails' => Rails.version) }
  it { expect(info).to include('Database' => ActiveRecord::Base.connection.adapter_name) }
  it { expect(info).to include('SSL' => true) }
  it { expect(info).to include('Application Server' => 'Unicorn 4.8.3') }
end
