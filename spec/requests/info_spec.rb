require 'spec_helper'

describe Info do
  it 'returns JSON' do
    get '/application/info'

    expect(response.content_type).to eq('application/json')
  end

  it 'returns collected information' do
    Info.add 'name', 'myapp'
    get '/application/info'

    expect(JSON.load(response.body)).to include('name' => 'myapp')
  end

  context 'username/password authorization' do
    before do
      Info.authorize {|username, password| username == 'john' && password == 'test' }
    end

    it 'accepts valid credentials' do
      get '/application/info', {}, 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Basic.encode_credentials('john', 'test')
      expect(response.code).to eq('200')
    end

    it 'rejects invalid credentials' do
      get '/application/info'
      expect(response.code).to eq('401')
    end
  end

  context 'token authorization' do
    before do
      Info.authorize {|token| token == 'abc' }
    end

    it 'accepts valid credentials' do
      get '/application/info', {}, 'HTTP_AUTHORIZATION' => ActionController::HttpAuthentication::Token.encode_credentials('abc')
      expect(response.code).to eq('200')
    end

    it 'rejects invalid credentials' do
      get '/application/info'
      expect(response.code).to eq('401')
    end
  end
end
