require 'socket'

require_relative 'classes/request'

server = TCPServer.new('localhost', 2345)

def request_valid?(request)

end

loop do

  socket = server.accept
  request = socket.recv(2000).split("\n")
  request_obj = Request.new(request)
  response = request_obj.results

  STDERR.puts request

  socket.print "HTTP/1.1 200 OK\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  socket.print "\r\n"
  socket.print response

  socket.close
end
