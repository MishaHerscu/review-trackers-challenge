require 'net/http'
require 'uri'

require_relative '../../main_function'

def test_server(test)
  uri = URI.parse(test[:uri])
  request_data = test[:data] if test[:data]

  if test[:http_method] == 'GET'
    begin
      request = Net::HTTP::Get.new(uri)
    rescue
      return false
    end
  elsif test[:http_method] == 'POST'
    begin
      request = Net::HTTP::Post.new(uri)
    rescue
      return false
    end
  elsif test[:http_method] == 'PATCH'
    begin
      request = Net::HTTP::Patch.new(uri)
    rescue
      return false
    end
  elsif test[:http_method] == 'DELETE'
    begin
      request = Net::HTTP::Delete.new(uri)
    rescue
      return false
    end
  else
    return false
  end

  if test[:data]
    request.body = request_data.to_json
  end

  begin
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
  rescue
    return 'warning: server must be on to run server tests!'
  end
  return response.body
end

def server_test_cases
  {
    :label => 'SERVER TESTS',
    :type => 'server',
    :test_cases => [
      {
        :http_method=> 'POST',
        :uri => '',
        :data => nil,
        :result => false,
        :label => 'testing POST with no uri and no data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'incorrect/uri',
        :data => nil,
        :result => false,
        :label => 'testing POST with incorrect uri and no data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => '',
        :data => 'xyz=123',
        :result => false,
        :label => 'testing POST with no uri and incorrect data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'incorrect/uri',
        :data => 'xyz=123',
        :result => false,
        :label => 'testing POST with incorrect uri and incorrect data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => nil,
        :result => 'bad request: requests must contain single data field called "uri"' + "\r\n",
        :label => 'testing POST with correct uri and no data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => 'xyz=123',
        :result => 'bad request: requests must contain single data field called "uri"' + "\r\n",
        :label => 'testing POST with correct uri and incorrect data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => 'xyz=123&uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => 'bad request: requests must contain single data field called "uri"' + "\r\n",
        :label => 'testing POST with correct uri and too much data',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'GET',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => 'bad request: server only accepts POST requests' + "\r\n",
        :label => 'testing case with correct uri and data but GET method',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'PATCH',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => 'bad request: server only accepts POST requests' + "\r\n",
        :label => 'testing case with correct uri and data but PATCH method',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'DELETE',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => 'bad request: server only accepts POST requests' + "\r\n",
        :label => 'testing case with correct uri and data but DELETE method',
        :warning => 'warning: server must be on to run server tests!'
      },
      {
        :http_method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => true,
        :label => 'testing correct case: correct uri, data, and http method',
        :warning => 'warning: server must be on to run server tests!'
      }
    ]
  }
end
