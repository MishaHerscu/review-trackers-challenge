# Source: https://practicingruby.com/articles/implementing-an-http-file-server
# Notes:
# I used this source for a simple http server to host the main function for the coding challenge.
# This is therefore mostly not my work.

# You can test this with two terminal windows:
# In the first just run 'ruby server.rb'
# In the second run this command with any desired url, I have an example below:
# curl -X POST 'http://localhost:2345/' -H 'Content-Type: application/json' -d { 'url': 'https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085' }
# curl -d 'url=https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085' http://localhost:2345/

# Note, the original testing curl request from the source had this: curl --verbose -XGET http://localhost:2345/anything

require 'socket' # Provides TCPServer and TCPSocket classes
require_relative 'main_function'

# Initialize a TCPServer object that will listen
# on localhost:2345 for incoming connections.
server = TCPServer.new('localhost', 2345)

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = server.accept

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request

  response = main_function(request)

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  # Print a blank line to separate the header from the response body,
  # as required by the protocol.
  socket.print "\r\n"

  # Print the actual response body
  socket.print response

  # Close the socket, terminating the connection
  socket.close
end
