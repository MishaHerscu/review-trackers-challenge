# example request:
# curl -X POST http://localhost:2345/ -d 'url=https://www.lendingtree.com/content/mu-plugins/lt-review-api/review-api-proxy.php?RequestType=&productType=&brandId=27085'

require 'socket'

require_relative 'main_function'

server = TCPServer.new('localhost', 2345)

loop do

  socket = server.accept
  request = socket.recv(2000).split("\n")

  # parse out URL
  request_url = request.last.split('url=')[1]

  # run code to get data
  response = main_function(request_url) + "\r\n"

  STDERR.puts request

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"
  socket.print response

  socket.close
end
