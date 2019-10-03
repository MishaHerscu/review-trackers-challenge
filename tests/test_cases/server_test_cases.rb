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
        :method=> 'POST',
        :uri => '',
        :data => nil,
        :result => false,
        :label => 'testing POST with no uri and no data'
      },
      {
        :method=> 'POST',
        :uri => 'incorrect/uri',
        :data => 'xyz=123',
        :result => false,
        :label => 'testing POST with incorrect uri and no data'
      },
      {
        :method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => 'xyz=123&uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => false,
        :label => 'testing POST with correct uri and too much data'
      },
      {
        :method=> 'GET',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => false,
        :label => 'testing case with correct uri and data but GET method'
      },
      {
        :method=> 'GET',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => false,
        :label => 'testing case with correct uri and data but PATCH method'
      },
      {
        :method=> 'GET',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => false,
        :label => 'testing case with correct uri and data but DELETE method'
      },
      {
        :method=> 'POST',
        :uri => 'http://localhost:2345/',
        :data => 'uri=https://www.lendingtree.com/reviews/personal/first-midwest-bank/52903183',
        :result => true,
        :label => 'testing correct case: correct uri, data, and http method'
      }
    ]
  }
end
