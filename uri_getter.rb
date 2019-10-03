require "net/http"
require "uri"

def uri_getter(request_uri)
  begin
    request_uri = URI.parse(request_uri)
    document = Net::HTTP.get(request_uri)

    lender_review_id = document.split('data-lenderreviewid')[1].split('"')[1]
    uri_root = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId='

    return uri_root + lender_review_id
  rescue
    return 'bad request in uri_getter for: ' + request_uri
  end
end
