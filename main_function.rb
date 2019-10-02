require_relative 'reviews_getter'

def checks(*args)
  return 'bad request: exactly one arg required"\n"' if args.count != 1
  url_beginning = 'https://www.lendingtree.com/'
  return 'bad request: url must start with ' + url_beginning + "\n" if args[0][0, url_beginning.length] != url_beginning
  return 'good request start'
end

def main_function(*args)
  request_type = checks(*args)
  if request_type == 'good request start'
    return reviews_getter(args[0])
  else
    return request_type
  end
end

# for testing
# main_function('https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085')
