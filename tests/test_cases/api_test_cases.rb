require_relative '../../main_function'

# def validate_api_results(data)
#   return true if data[0] == '{'
#   return false
# end

def validate_api_results
  return false
end

# Test review.rb
def api_test_cases
  {
    :label => 'API TESTS',
    :test_cases => [
      {
        :data => main_function(''),
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => main_function('incorrect/uri'),
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => main_function('https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183'),
        :test_method => 'validate_api_results',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
