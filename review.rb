class Review

  @@url_beginning = 'https://www.lendingtree.com/'

  def initialize(uri, hash)

    # source url
    @uri = uri

    # primary info
    @primary_info = {
      :authorName => hash['authorName'],
      :title => hash['title'],
      :text => hash['text'],
      :lastModificationDateTime => hash['lastModificationDateTime'],
      :primaryRating => hash['primaryRating']
    },

    # secondary info
    @secondary_info = {
      :authorId => hash['authorId'],
      :authorEmail => hash['authorEmail'],
      :userLocation => hash['userLocation'],
      :isRecommended => hash['isRecommended'],
      :votesUp => hash['votesUp'],
      :votesDown => hash['votesDown'],
      :properties => hash['properties'],
      :isFlagged => hash['isFlagged'],
      :socialSurveyReviewId => hash['socialSurveyReviewId'],
      :socialSurveyUpdateTime => hash['socialSurveyUpdateTime'],
      :isImported => hash['isImported'],
      :moderationStatus => hash['moderationStatus'],
      :message => hash['message'],
      :isModerationSubmitted => hash['isModerationSubmitted'],
      :moderationSubmissionTime => hash['moderationSubmissionTime'],
      :moderatorDetails => hash['moderatorDetails'],
      :anonymousUId => hash['anonymousUId'],
      :isAuthenticated => hash['isAuthenticated'],
      :isVerifiedCustomer => hash['isVerifiedCustomer'],
      :originName => hash['originName'],
      :ipAddress => hash['ipAddress'],
      :isRatingOnly => hash['isRatingOnly'],
      :submissionDateTime => hash['submissionDateTime'],
      :insertDateTime => hash['insertDateTime'],
      :updateDateTime => hash['updateDateTime'],
      :insertHost => hash['insertHost'],
      :updateHost => hash['updateHost'],
      :secondaryRatings => hash['secondaryRatings'],
      :productId => hash['productId'],
      :productType => hash['productType'],
      :brandId => hash['brandId'],
      :lenderId => hash['lenderId'],
      :id => hash['id']
    }

  end

  def valid
    return false if @@url_beginning != @uri[0, @@url_beginning.length]
    return false if !@primary_info
    return true
  end

  def display_primary_info
    p @primary_info
  end
end
