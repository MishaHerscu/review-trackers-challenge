# example request:
# curl -X POST http://localhost:2345/ -d 'url=https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085'

require 'socket'

require_relative 'main_function'

server = TCPServer.new('localhost', 2345)

loop do

  socket = server.accept
  data = socket.recv(2000).split("\n")

  # parse out URL
  request_url = data.last.split('=')[1]

  # run code to get data
  response = main_function(request_url)

  # Log the request to the console for debugging
  STDERR.puts response

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
