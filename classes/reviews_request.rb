require "net/http"
require "uri"
require "json"
require_relative 'review'

class ReviewsRequest

  @@final_uri_root = 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId='

  def initialize(uri)
    @final_uri = uri
    get_reviews
  end

  def final_uri
    @final_uri
  end

  def reviews
    @reviews
  end

  def formatted_reviews
    @formatted_reviews
  end

  def valid?
    return false if @@final_uri_root != @final_uri[0, @@final_uri_root.length]
    true
  end

  def reviews_are_valid?
    return false unless @reviews
    return false unless @reviews.is_a? Enumerable
    true
  end

  def get_reviews
    begin
      final_request_uri = URI.parse(@final_uri)
      document = Net::HTTP.get(final_request_uri)
      raw_json_data = JSON.parse(document)
      hashed_data = {
        :total => raw_json_data["total"],
        :filteredCount => raw_json_data["filteredCount"],
        :result => raw_json_data["result"],
        :reviews => raw_json_data["result"]["reviews"],
      }
      reviews_to_return = []
      hashed_data[:reviews].each do |hash|
        new_review = Review.new(@final_uri, hash)
        reviews_to_return << new_review if new_review.valid?
      end
      @reviews = reviews_to_return
    rescue
      @reviews = nil
    end
  end

  def format_reviews
    @formatted_reviews = []
    @reviews.each do |review|
      @formatted_reviews << review.primary_info if review.valid?
    end
    @formatted_reviews
  end

  def results_or_errors
    if reviews_are_valid?
      format_reviews
      @formatted_reviews
    else
      'no valid reviews for final_uri: ' + @final_uri if @reviews
    end
  end

  def request_error_message
    'bad request for final_uri: ' + @final_uri
  end

end
