require_relative '../../classes/review'

def review_test_cases
  {
    :label => 'Review CLASS TESTS',
    :type => 'class',
    :test_cases => [
      {
        :data => Review.new('test_uri', {}),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri and no hash'
      },
      {
        :data => Review.new('test_uri', { :authorName => 'Mike' }),
        :test_method => 'valid?',
        :result => false,
        :label => 'testing incorrect uri with hash'
      },
      {
        :data => Review.new('https://www.lendingtree.com/', { :authorName => 'Mike' }),
        :test_method => 'valid?',
        :result => true,
        :label => 'testing correct uri and hash'
      }
    ]
  }
end
