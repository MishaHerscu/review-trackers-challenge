require "net/http"
require "uri"
require_relative '../main_function'

class Request

  def initialize(request)
    @request = request
  end

  def request
    @request
  end

  def http_method
    @http_method
  end

  def request_uri
    @request_uri
  end

  def error_message
    @error_message
  end

  def set_http_method
    @http_method = @request.first.split(' ')[0]
  end

  def set_request_uri
    if @request.last.include? '&'
      @request_uri = nil
    else
      @request_uri = @request.last.split('uri=')
    end
  end

  def valid?
    return false unless @request_uri
    return true if @http_method == 'POST' && @request_uri.length == 2
    false
  end

  def set_error_message
    if @http_method != 'POST'
      @error_message = 'bad request: server only accepts POST requests'
    elsif !@request_uri
      @error_message = 'bad request: requests must contain single data field called "uri"'
    elsif @request_uri.length != 2
      @error_message = 'bad request: requests must contain single data field called "uri"'
    else
      @error_message = 'bad request'
    end
  end

  def results
    set_http_method
    set_request_uri
    if self.valid?
      return main_function(@request_uri[1]).to_s + "\r\n"
    else
      set_error_message
      return error_message.to_s + "\r\n"
    end
  end

end
