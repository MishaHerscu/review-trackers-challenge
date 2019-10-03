require "net/http"
require "uri"

class RequestUri

  @@request_uri_root = 'https://www.lendingtree.com/'
  @@final_uri_root = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId='

  def initialize(request_uri)
    @request_uri = request_uri
  end

  def request_uri
    @request_uri
  end

  def final_uri
    @final_uri
  end

  def valid?
    return false if @@request_uri_root != @request_uri[0, @@request_uri_root.length]
    return false unless self.final_uri
    true
  end

  def error
    'bad request: uri must start with "' + @@request_uri_root + '"'
  end

  def set_final_uri
    begin
      requested_uri = URI.parse(@request_uri)
      document = Net::HTTP.get(requested_uri)
      lender_review_id = document.split('data-lenderreviewid')[1].split('"')[1]
      @final_uri = @@final_uri_root + lender_review_id
    rescue
      @final_uri = nil
    end
  end

end
