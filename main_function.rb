require_relative 'classes/request_uri'
require_relative 'classes/reviews_request'

def get_reviews(uri)
  begin
    request = ReviewsRequest.new(uri)
    return request.request_error_message unless request.valid?
    request.results_or_errors
  rescue
    'get reviews - bad request for: ' + uri
  end
end

def main_function(uri)
  begin
    request_uri = RequestUri.new(uri)
    return request_uri.error unless request_uri.valid?
    get_reviews(request_uri.final_uri)
  rescue
    'main function - bad request for: ' + uri
  end
end
