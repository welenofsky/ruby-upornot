require "socket"

unless server = ARGV[0]
	puts "Need to provide server address"
	exit
end

begin
	s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
	s.connect Socket.pack_sockaddr_in(80, server)
rescue SocketError
	puts "Error connecting to host: #{server}"
end