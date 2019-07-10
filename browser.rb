require 'rubygems'
require 'selenium-webdriver'

class Browser
	def run
		driver = Selenium::WebDriver.for :chrome
		driver.manage.timeouts.implicit_wait = 60
		driver.get 'https://app-automate.browserstack.com/'
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		element = driver.find_element(:id, "user_email_login")
		wait.until{ element.displayed? && element.enabled?}
		element.send_keys "uday.agg97@gmail.com"
		element = driver.find_element(:id, "user_password")
		wait.until{ element.displayed? && element.enabled?}
		element.send_keys "********************"
		driver.find_element(:id, "user_submit").click
		element = driver.find_element(:css, "a[title= 'Uday_sample_test']")
		wait.until{ element.displayed? && element.enabled?}
		element.click
		element = driver.find_element(:class, "status-text")
		wait.until{ element.displayed?}
		msg = element.text
		driver.quit
		return msg
	end
end

# instance = Browser.new
# instance.run
