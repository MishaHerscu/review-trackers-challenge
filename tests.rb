# Testing Framework

# Sources to test
require 'colorize'

require_relative 'test_cases'

# Run tests and print results
review_tests.each do |test|
  test_result = test[:data].send(test[:test_method]) == test[:result]
  if test_result
    success_string = test[:label] + ' passed!'
    puts success_string.green
  else
    failure_string = test[:label] + ' failed!'
    puts failure_string.red
  end
end
