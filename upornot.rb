require "socket"
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

class OptparseExample

  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.server = "8.8.8.8"
    options.delay = 30
    options.watch = false

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: upornot.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # Mandatory argument.
      opts.on("-s", "--server SERVER",
              "Require the SERVER before executing your script") do |serv|
        options.server = serv
      end

      # Cast 'delay' argument to a Fixnum.
      opts.on("-d", "--delay N", Integer, "Delay N seconds between checks") do |n|
        options.delay = n
      end

      # Boolean switch.
      opts.on("-w", "--watch", "Keep watch on server") do |w|
        options.watch = w
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

    end

    opt_parser.parse!(args)
    options
  end  # parse()

end  # class OptparseExample

options = OptparseExample.parse(ARGV)

def check_server(server)
	begin
		Socket.gethostbyname(server)
		puts "Online #{Time.now}"
	rescue SocketError
		puts "Offline: Error connecting to host: #{server} at #{Time.now}"
	end
end

loop do
	check_server(options[:server])

	unless options[:watch]
		exit
	end

	sleep(options[:delay])
end