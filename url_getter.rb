require "net/http"
require "uri"

def url_getter(request_url)
  begin
    request_url = URI.parse(request_url)
    document = Net::HTTP.get(request_url)

    lender_review_id = document.split('data-lenderreviewid')[1].split('"')[1]
    url_root = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId='

    return url_root + lender_review_id
  rescue
    return 'bad request in url_getter for: ' + request_url
  end
end
