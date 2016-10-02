require "socket"

begin
	s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
	s.connect Socket.pack_sockaddr_in(80, 'asdklfjasdljflkjfd.com')
rescue SocketError
	puts "Error connecting to host"
end