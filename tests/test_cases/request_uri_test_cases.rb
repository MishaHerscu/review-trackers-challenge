# Sources to test
require_relative '../../classes/request_uri'
require_relative '../../main_function'

def generate_test_data(input)
  current_request_uri = RequestUri.new(input)
  current_request_uri.get_final_uri
  return current_request_uri
end

# Test review.rb
def request_uri_test_cases
  {
    :label => 'RequestUri CLASS TESTS',
    :test_cases => [
      {
        :data => generate_test_data(''),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => generate_test_data('incorrect/uri'),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => generate_test_data('https://www.lendingtree.com/'),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing correct uri root but no id'
      },
      {
        :data => generate_test_data('https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183'),
        :test_method => 'valid?',
        :result => true,
        :label => 'testing correct uri root with working id'
      }
    ]
  }
end
