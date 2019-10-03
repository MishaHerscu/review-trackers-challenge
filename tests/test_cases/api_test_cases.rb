require_relative '../../main_function'
require_relative '../../classes/review'

def test_api(test)
  api_data = main_function(test[:data])
  potential_review = Review.new(test[:data], api_data[0])
  return api_data[0].class == Hash && potential_review.valid?
end

def api_test_cases
  {
    :label => 'API TESTS',
    :type => 'api',
    :test_cases => [
      {
        :data => '',
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :data => 'incorrect/uri',
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :data => 'https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :test_method => 'validate_api_results',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
