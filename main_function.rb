require_relative 'reviews_getter'
require_relative 'classes/request_uri'

def checks(*args)
  return 'bad request: exactly one arg required"\n"' if args.count != 1
  uri_beginning = 'https://www.lendingtree.com/'
  return 'bad request: uri must start with "' + uri_beginning + '"' + "\n" if args[0][0, uri_beginning.length] != uri_beginning
  return 'good request start'
end

def format_response(reviews)
  formatted_response = []
  reviews.each do |review|
    formatted_response << review.primary_info
  end
  return formatted_response
end

def request_reviews(*args)
  request_type = checks(*args)
  if request_type == 'good request start'
    review_data = reviews_getter(args[0])
    if review_data.is_a? Enumerable
      return format_response(review_data)
    else
      return review_data
    end
  else
    return request_type
  end
end

def main_function(request_uri)
  current_request_uri = RequestUri.new(request_uri)
  return current_request_uri.error_message unless current_request_uri.valid?
  if current_request_uri.final_uri
    request_reviews(current_request_uri.final_uri)
  else
    return 'bad request for: ' + request_uri
  end
end
