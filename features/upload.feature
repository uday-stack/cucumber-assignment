Feature: Upload
	
	Scenario Outline: Upload an apk file
		Given a path:<path> with credentials of user id as:<user> and access key:<key> to an apk file as input
		And that a response containing app_url is present
		When the app is tested
		Then status on the App Automate Dashboard of the tested app should be obtained as Completed

		Examples:
		|                      path 				  |		user	|	key		 |
		|"/Users/udayaggarwal/downloads/WikipediaSample.apk"|	 "udayaggarwal2"	|"SRXKuYCLmzxrhwdVp2st"|