Feature: Google Search

	Background:
		Given the browser opened the google home page

	Scenario: Search results contain search term	
		When I submit the search term "buster keaton"

		Then the search results should each contain "buster"
		And the search results should each contain "keaton"

		Then the knowledge panel should contain "born"
		And the knowledge panel should contain "died"
		And the knowledge panel should contain "height"

	  	Then the also asked questions should each contain "buster"
  		And the also asked questions should each contain "keaton"
