class Review

  @@request_uri_root = 'https://www.lendingtree.com/'

  def initialize(uri, hash)

    @uri = uri

    @primary_info = {
      :authorName => hash['authorName'],
      :title => hash['title'],
      :text => hash['text'],
      :lastModificationDateTime => hash['lastModificationDateTime'],
      :primaryRating => hash['primaryRating'] ? hash['primaryRating']['value'] : nil
    }

    # Not returning to client in current version
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

  def uri
    @uri
  end

  def primary_info
    @primary_info
  end

  def secondary_info
    @secondary_info
  end

  def valid?
    return false if @@request_uri_root != @uri[0, @@request_uri_root.length]
    return false if !@primary_info
    true
  end

end
