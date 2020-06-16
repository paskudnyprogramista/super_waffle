# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'https://jsonplaceholder.typicode.com/users')
      .with(
        headers: {
          'Connection' => 'close',
          'Host' => 'jsonplaceholder.typicode.com',
          'User-Agent' => 'http.rb/4.4.1'
        }
      )
      .to_return(status: 200, body: [].to_json, headers: {})
  end
end
