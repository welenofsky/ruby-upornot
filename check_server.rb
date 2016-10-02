require 'socket'

def check_server(server)
	begin
		Socket.gethostbyname(server)
		"Online #{Time.now}"
	rescue SocketError
		"Offline: Error connecting to host: #{server} at #{Time.now}"
	end
end