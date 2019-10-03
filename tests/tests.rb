# Testing Framework

# Sources to test
require 'colorize'

require_relative 'test_cases/request_uri_test_cases'
require_relative 'test_cases/review_test_cases'
require_relative 'test_cases/reviews_request_test_cases'
require_relative 'test_cases/api_test_cases'

# function for running tests
def run_tests(test_cases, section_iter)
  test_iter = 0
  puts section_iter.to_s + ' _____ ' + test_cases[:label] + ' _____'
  puts "\n"
  test_cases[:test_cases].each do |test|
    test_iter += 1
    test_result = test[:data].send(test[:test_method]) == test[:result]
    if test_result
      success_string = section_iter.to_s + '.' + test_iter.to_s + '. ' + test[:label] + ' passed!'
      puts success_string.green
    else
      failure_string = section_iter.to_s + '.' + test_iter.to_s + '. ' + test[:label] + ' failed!'
      puts iter.to_s + '. ' + failure_string.red
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
section_iter = 0
puts "\n"
test_library.each do |test_cases|
  section_iter += 1
  run_tests(test_cases, section_iter)
  puts "\n\n"
end
puts "\n"
