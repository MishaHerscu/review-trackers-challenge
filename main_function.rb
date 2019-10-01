require_relative 'reviews_getter'

# uri = URI.parse('https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085&requestmode=reviews,stats,ratingconfig,propertyconfig&page=0&sortby=reviewsubmitted&sortorder=desc&pagesize=10&AuthorLocation=All&_t=1569899172003')
arguments = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085'
# arguments = 'https://www.lendingtree.com/content/mu-plugins/lt-revi/review-api-proxy.php?RequestType=&productType=&brandId=27085'

def checks(*args)
  return 'bad request: exactly one arg required' if args.count != 1
  url_beginning = 'https://www.lendingtree.com/'
  return 'bad request: url must start with ' + url_beginning if args[0][0, url_beginning.length] != url_beginning
  return 'good request start'
end

def main_function(*args)
  request_type = checks(*args)
  if request_type == 'good request start'
    p reviews_getter(args[0])
  else
    return request_type
  end
end

main_function(arguments)
