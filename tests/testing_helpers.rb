require 'net/http'
require 'uri'

require_relative '../main_function'
require_relative '../classes/review'
require_relative '../classes/request_uri'

def generate_uri_test_data(input)
  current_request_uri = RequestUri.new(input)
  current_request_uri.set_final_uri
  return current_request_uri
end

def test_api(test)
  api_data = main_function(test[:data])
  potential_review = Review.new(test[:data], api_data[0])
  return api_data[0].class == Hash && potential_review.valid?
end

def test_server(test)
  uri = URI.parse(test[:uri])

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

  begin
    request.body = test[:data] if test[:data]
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
  rescue
    return 'warning: server must be on to run server tests!'
  end
  initial_response = response.body
  final_response = initial_response[0] != '[' ? initial_response : true
  return final_response
end
