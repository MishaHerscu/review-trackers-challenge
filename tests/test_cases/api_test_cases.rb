# Sources to test
require_relative '../../main_function'

# Test review.rb
def api_test_cases
  {
    :label => 'API TESTS',
    :test_cases => [
      {
        :data => '',
        :test_method => 'main_function',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => 'incorrect/uri',
        :test_method => 'main_function',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => 10,
        :test_method => 'main_function',
        :result => false,
        :label => 'testing incorrect uri with number'
      },
      {
        :data => 'https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :test_method => 'main_function',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
