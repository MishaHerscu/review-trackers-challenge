# Testing Framework

# Sources to test
require_relative 'test_cases'

# Run tests and print results
review_tests.each do |test|
  test_result = test[:data].send(test[:test_method]) == test[:result]
  if test_result
    p test[:label] + ' passed!'
  else
    p test[:label] + ' failed!'
  end
end
