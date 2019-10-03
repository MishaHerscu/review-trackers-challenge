# Sources to test
require_relative '../../classes/request_uri'
require_relative '../../main_function'

# Test review.rb
def request_uri_test_cases
  {
    :label => 'RequestUri CLASS TESTS',
    :test_cases => [
      {
        :data => RequestUri.new(''),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => RequestUri.new('incorrect/uri'),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => RequestUri.new('https://www.lendingtree.com/'),
        :test_method => 'valid?',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
