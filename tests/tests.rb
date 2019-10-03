# Testing Framework

# To color terminal output
require 'colorize'

# Import test sections
require_relative 'test_cases/request_uri_test_cases'
require_relative 'test_cases/review_test_cases'
require_relative 'test_cases/reviews_request_test_cases'
require_relative 'test_cases/api_test_cases'
require_relative 'test_cases/server_test_cases'

# Functions for running through test sections
def run_tests(test_section, section_iter)
  test_iter = 0
  puts section_iter.to_s + '. _____ ' + test_section[:label] + ' _____'
  puts "\n"
  test_section[:test_cases].each do |test|
    test_iter += 1
    if test_section[:type] == 'api'
      result = test_api(test)
    elsif test_section[:type] == 'server'
      result = test_server(test)
    else
      result = test[:data].send(test[:test_method])
    end
    if result == test[:result]
      success_string = section_iter.to_s + '.' + test_iter.to_s + '. ' + test[:label] + ' passed!'
      puts success_string.green
    else
      failure_string = section_iter.to_s + '.' + test_iter.to_s + '. ' + test[:label] + ' failed!'
      puts failure_string.red
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
    api_test_cases,
    server_test_cases
  ]

  # Actually run tests and print out results
  section_iter = 0
  puts "\n"
  test_library.each do |test_section|
    section_iter += 1
    run_tests(test_section, section_iter)
    puts "\n\n"
  end

end

# Run the tests
run_all_tests
