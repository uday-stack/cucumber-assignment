require 'rubygems'
require 'appium_lib'

class Test
	def initialize(url, user, key)
		@app_url = url
		@user = user
		@key = key
	end
	def test_start 
		capabilities
		appium_driver = Appium::Driver.new({
    		'caps' => @caps,
    		'appium_lib' => {
        		:server_url => "http://#{@user}:#{@key}@hub-cloud.browserstack.com/wd/hub"
    		}}, true)
		driver = appium_driver.start_driver
		msg = selenium_automate(driver)
		return msg
	end
	private 
	def capabilities
		@caps = {}
		@caps['build'] = 'Ruby Appium Sample'
		@caps['name'] = 'Uday_sample_test'
		@caps['device'] = 'Samsung Galaxy S8 Plus'
		@caps['platformName'] = 'android'
		@caps['browserstack.debug'] = true
		@caps['app'] = @app_url
	end
	def selenium_automate(driver)
		wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		wait.until { driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
		element = driver.find_element(:accessibility_id, "Search Wikipedia")
		element.click
 
		wait.until { driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text").displayed? }
		search_box = driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text")
		search_box.send_keys("BrowserStack")
		sleep 5
 
		results = driver.find_elements(:class, "android.widget.TextView")
		if results.count > 0
    		msg = "passed"
		else
    		msg = "failed"
		end
		driver.quit
		return msg
	end
end
