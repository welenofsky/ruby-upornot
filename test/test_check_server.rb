require 'minitest/autorun'
require_relative '../check_server'

class TestCheckServer < Minitest::Test

	def test_good_server_name
		assert_match('Online', check_server('google.com'))
	end

	def test_good_ip
		assert_match('Online', check_server('8.8.8.8'))
	end

	def test_bad_server_name
		assert_match('Offline', check_server('nowaythisisarealservername.kjkjkj'))
	end

	def test_bad_ip
		assert_match('Offline', check_server('256.256.256.256'))
	end
end