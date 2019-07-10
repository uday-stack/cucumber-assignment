require 'net/http'
require 'uri'

class Upload
	attr_reader :path
	def initialize(path, user_id, key)
		@path = path
		@user_id = user_id
		@key = key
	end
	def get_url
		return %x{curl -u "#{@user_id}:#{@key}" -X POST "https://api-cloud.browserstack.com/app-automate/upload" -F "file=@#{@path}"}
	end
end