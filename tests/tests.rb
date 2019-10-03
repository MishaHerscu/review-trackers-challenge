# Testing Framework

# Sources to test
require 'colorize'

require_relative 'test_cases/request_uri_test_cases'
require_relative 'test_cases/review_test_cases'
require_relative 'test_cases/reviews_request_test_cases'
require_relative 'test_cases/api_test_cases'

# function for running tests
def run_tests(test_cases)
  puts '_____ ' + test_cases[:label] + ' _____'
  test_cases[:test_cases].each do |test|
    test_result = test[:data].send(test[:test_method]) == test[:result]
    if test_result
      success_string = test[:label] + ' passed!'
      puts success_string.green
    else
      failure_string = test[:label] + ' failed!'
      puts failure_string.red
    end
  end
end

# array of imported tests
test_library = [
  request_uri_test_cases,
  review_test_cases,
  reviews_request_test_cases,
  api_test_cases
]

# actually run the tests
test_library.each do |tests|
  run_tests(tests)
end
