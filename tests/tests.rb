# Testing Framework

# To color terminal output
require 'colorize'

# Import test sections
require_relative 'test_cases/request_uri_test_cases'
require_relative 'test_cases/review_test_cases'
require_relative 'test_cases/reviews_request_test_cases'
require_relative 'test_cases/api_test_cases'

# Function for running through test cases within each section
def run_tests(test_cases, section_iter)
  test_iter = 0
  puts section_iter.to_s + '. _____ ' + test_cases[:label] + ' _____'
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

# Function for running all tests and printing out results
def run_all_tests

  # Array of test sections
  test_library = [
    request_uri_test_cases,
    review_test_cases,
    reviews_request_test_cases,
    api_test_cases
  ]

  # Actually run tests and print out results
  section_iter = 0
  puts "\n"
  test_library.each do |test_section|
    section_iter += 1
    run_tests(test_section, section_iter)
    puts "\n\n"
  end
  puts "\n"

end

# Run the tests
run_all_tests
