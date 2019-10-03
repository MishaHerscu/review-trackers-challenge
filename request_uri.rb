require "net/http"
require "uri"

class RequestUri

  @@request_uri_root = 'https://www.lendingtree.com/'
  @@final_uri_root = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId='

  def initialize(uri)
    @uri = uri
  end

  def uri
    @uri
  end

  def valid?
    return false if @@request_uri_root != @uri[0, @@request_uri_root.length]
    return true
  end

  def error_message
    return 'bad request: uri must start with "' + @@request_uri_root + '"'
  end

  def display
    puts @uri
  end

  def final_uri
    begin
      request_uri = URI.parse(@uri)
      document = Net::HTTP.get(request_uri)
      lender_review_id = document.split('data-lenderreviewid')[1].split('"')[1]
      return @@final_uri_root + lender_review_id
    rescue
      return 'bad request in uri_getter for: ' + @uri
    end
  end
end
