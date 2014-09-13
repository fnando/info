require 'spec_helper'

describe Info::Configuration do
  subject(:config) { Info::Configuration.new }

  it 'enables collection' do
    config.disable!
    config.enable!

    expect(config).to be_enabled
  end

  it 'disables collection' do
    config.enable!
    config.disable!

    expect(config).not_to be_enabled
  end

  it 'sets authorization' do
    config.authorize {}
    expect(config.authorizer).to be_a(Proc)
  end

  it 'adds collector' do
    config.add 'key', 'value'
    expect(config.collectors).to include(name: 'key', value: 'value')
  end

  it 'collects primitive values' do
    config.add 'name', 'myapp'
    expect(config.collect).to include('name' => 'myapp')
  end

  it 'collects value from callable objects (arity=0)' do
    config.add 'name', -> { 'myapp' }
    expect(config.collect).to include('name' => 'myapp')
  end

  it 'collects value from callable objects (arity=1)' do
    request = double('request', name: 'myapp')
    config.add 'name', -> r { r.name }

    expect(config.collect(request)).to include('name' => 'myapp')
  end
end
