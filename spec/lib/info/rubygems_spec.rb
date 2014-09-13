require 'spec_helper'

describe 'Rubygems' do
  before {
    spec = double('spec', name: 'mygem', version: '0.1.0')
    allow(Gem).to receive(:loaded_specs).and_return(mygem: spec)

    load 'info/rubygems.rb'
  }
  subject(:info) { Info.collect }

  it 'collects Rubygems info' do
    expect(info['Rubygems']).to include(name: 'mygem', version: '0.1.0')
  end
end
