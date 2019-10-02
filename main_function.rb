require_relative 'reviews_getter'
require_relative 'url_getter'

def checks(*args)
  return 'bad request: exactly one arg required"\n"' if args.count != 1
  url_beginning = 'https://www.lendingtree.com/'
  return 'bad request: url must start with "' + url_beginning + '"' + "\n" if args[0][0, url_beginning.length] != url_beginning
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

def main_function(request_url)
  final_url = url_getter(request_url)
  p 'final_url: ', final_url
  if final_url
    request_reviews(final_url)
  else
    return 'bad request for: ' + url
  end
end
