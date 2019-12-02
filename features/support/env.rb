require "selenium-webdriver"

case ENV['BROWSER']
when 'chrome'
	browser = :chrome
	driver_path = '/selenium_browser_drivers/chromedriver'
when 'firefox'
	browser = :firefox
	driver_path = '/selenium_browser_drivers/geckodriver'
else
	br = ENV['BROWSER']
	msg1 = br ? "Unexpected value '#{br}'." : "Missing BROWSER= argument."
	msg2 = "  Expected BROWSER argument to be one of 'chrome' or 'firefox'."
	raise ArgumentError.new(msg1+msg2) 
	exit 		
end

Selenium::WebDriver::Chrome::Service.driver_path = driver_path
$driver = Selenium::WebDriver.for browser