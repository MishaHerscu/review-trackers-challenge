require_relative '../../main_function'

def test_server(test)
  return true
end

def server_test_cases
  {
    :label => 'SERVER TESTS',
    :type => 'server',
    :test_cases => [
      {
        :url => '',
        :data => nil,
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing no uri'
      },
      {
        :url => 'incorrect/uri',
        :data => 'xyz=123',
        :test_method => 'validate_api_results',
        :result => false,
        :label => 'testing incorrect uri with string'
      },
      {
        :url => 'https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :data => 'xyz=123&url=',
        :test_method => 'validate_api_results',
        :result => true,
        :label => 'testing correct uri'
      }
    ]
  }
end
