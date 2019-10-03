require_relative '../../classes/reviews_request'

def reviews_request_test_cases
  {
    :label => 'ReviewsRequest CLASS TESTS',
    :type => 'class',
    :test_cases => [
      {
        :data => ReviewsRequest.new(''),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => ReviewsRequest.new('incorrect/uri'),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => ReviewsRequest.new('https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=123456789'),
        :test_method => 'valid?',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
