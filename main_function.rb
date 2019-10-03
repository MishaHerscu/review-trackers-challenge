require_relative 'classes/request_uri'
require_relative 'classes/reviews_request'

def request_reviews(uri)
  begin
    request = ReviewsRequest.new(uri)
    return request.request_error_message unless request.valid?
    request.get_reviews
    return request.results_or_errors
  rescue
    return 'request reviews - bad request for: ' + uri
  end
end

def main_function(uri)
  begin
    request_uri = RequestUri.new(uri)
    request_uri.get_final_uri
    return request_uri.error unless request_uri.valid?
    return request_reviews(request_uri.final_uri)
  rescue
    return 'main function - bad request for: ' + uri
  end
end
