Feature: Login capability. Logging in will allow users to access restricted pages.


    Scenario: New user tries to log in
        Given I am a new user
        When I navigate to Log In page and enter an email and password
        Then the Log In page is loaded

		Scenario: User who is already registered logs in.
				Given I am already registered
        When I navigate to Log In page and enter my information
        Then the profile page is loaded