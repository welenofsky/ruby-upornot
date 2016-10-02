require "socket"

unless server = ARGV[0]
	puts "Need to provide server address"
	exit
end

def check_server(server)
	begin
		s = Socket.new Socket::AF_INET, Socket::SOCK_STREAM
		s.connect Socket.pack_sockaddr_in(80, server)
		puts "Online #{Time.now}"
	rescue SocketError
		puts "Offline: Error connecting to host: #{server} at #{Time.now}"
	end
	true
end

loop do
	check_server(server) && sleep(30)
end