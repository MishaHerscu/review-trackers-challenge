# Sources to test
require_relative 'review'
require_relative 'reviews_getter'
require_relative 'main_function'

# Test review.rb
def review_tests
  return [
    {
      :data => Review.new('test_url', {}),
      :test_method => 'valid',
      :result => false,
      :label => 'testing incorrect url and no hash'
    },
    {
      :data => Review.new('test_url', { :authorName => 'Mike' }),
      :test_method => 'valid',
      :result => false,
      :label => 'testing incorrect url with hash'
    },
    {
      :data => Review.new('https://www.lendingtree.com/', { :authorName => 'Mike' }),
      :test_method => 'valid',
      :result => true,
      :label => 'testing correct url and hash'
    }
  ]
end
