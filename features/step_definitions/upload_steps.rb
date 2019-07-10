require_relative '../../upload'
require_relative '../../test'
require_relative '../../browser'

Given("a path:{string} with credentials of user id as:{string} and access key:{string} to an apk file as input") do |path, user, key|
	@user = user
	@key = key
	uploader = Upload.new(path, @user, @key)
	@url = uploader.get_url
	@url = eval(@url)
end

And("that a response containing app_url is present") do
	expect(@url.keys.first.to_s).to eql("app_url")
	@bs_url = @url.values.first
	expect(@bs_url[0,2]).to eql("bs")
end

When("the app is tested") do
	tester = Test.new(@bs_url, @user, @key)
	msg = tester.test_start
	expect(msg).to eql("passed")
end

Then("status on the App Automate Dashboard of the tested app should be obtained as Completed") do
	new_browser = Browser.new
	msg = new_browser.run
	expect(msg).to eql("Completed")
end