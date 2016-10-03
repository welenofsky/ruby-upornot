require 'minitest/autorun'
require_relative '../check_server'

class TestCheckServer < Minitest::Test

	def test_good_server_name
		$output = `ruby ../upornot.rb --server google.com`;
		assert_match('Online', $output)
	end

	def test_good_ip
		$output = `ruby ../upornot.rb --server 8.8.8.8`;
		assert_match('Online', $output)
	end

	def test_bad_server_name
		$output = `ruby ../upornot.rb --server nowaythisisarealservername.kjkjkj`;
		assert_match('Offline', $output)
	end

	def test_bad_ip
		$output = `ruby ../upornot.rb --server 256.256.256.256`;
		assert_match('Offline', $output)
	end
end