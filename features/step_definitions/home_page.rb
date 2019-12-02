require "selenium-webdriver"

class HomePage
	attr_reader :wait, :home_url, :locs

	def initialize()
		@wait = Selenium::WebDriver::Wait.new(:timeout => 15)
		@home_url = 'https://www.google.com'
		@locs = {
			search_input: {css: 'input[name=q]'}, 
			search_button: {css: 'div.FPdoLc input[name="btnK"]'},
		}
	end

end

Given("the browser opened the google home page") do
	@home_page = HomePage.new()
	$driver.get(@home_page.home_url)
end

When('I submit the search term {string}') do |search_term|
	$driver.find_element(@home_page.locs[:search_input]).send_keys(search_term)
	@home_page.wait.until { $driver.find_element(@home_page.locs[:search_button]) }
	$driver.find_element(@home_page.locs[:search_button]).click
	sleep(2)
end
