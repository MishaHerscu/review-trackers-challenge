# Tests

# Sources to test
require_relative 'review'
require_relative 'reviews_getter'
require_relative 'main_function'

# Test review.rb
test_review_0 = Review.new('test_url', {})
test_review_1 = Review.new('test_url', { :authorName => 'Mike' })
test_review_2 = Review.new('https://www.lendingtree.com/', { :authorName => 'Mike' })

p test_review_0.valid # false
p test_review_1.valid # false
p test_review_2.valid # true
