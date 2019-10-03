class RequestUri

  @@uri_beginning = 'https://www.lendingtree.com/'

  def initialize(uri)
    @uri = uri
  end

  def uri
    @uri
  end

  def valid?
    return false if @@uri_beginning != @uri[0, @@uri_beginning.length]
    return true
  end

  def error_message
    return 'bad request: uri must start with "' + @@uri_beginning + '"'
  end

  def display
    puts @uri
  end
end
