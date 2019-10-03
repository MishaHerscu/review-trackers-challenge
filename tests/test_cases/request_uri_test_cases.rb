# Sources to test
require_relative '../../classes/review'
require_relative '../../main_function'

# Test review.rb
def request_uri_test_cases
  {
    :label => '_____ REQUEST URL CLASS TESTS _____',
    :test_cases => [
      {
        :data => Review.new('test_uri', {}),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri and no hash'
      },
      {
        :data => Review.new('test_uri', { :authorName => 'Mike' }),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri with hash'
      },
      {
        :data => Review.new('https://www.lendingtree.com/', { :authorName => 'Mike' }),
        :test_method => 'valid?',
        :result => true,
        :label => 'testing correct uri and hash'
      }
    ]
  }
end
