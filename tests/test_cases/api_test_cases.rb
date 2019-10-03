require_relative '../../main_function'

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
