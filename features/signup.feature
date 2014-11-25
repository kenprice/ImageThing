Feature: A new user goes to registration page and enters valid information (e-mail, password, password confirm, etc.).
User successfully registers and is automatically redirected to his profile page.

	Scenario: New user attempts to register with minimum valid information
		Given I am a new user
		And I load the signup page
		And I fill in "user_email" with "test2@test.com"
		And I fill in "user_name" with "Someuser2"
		And the user inputs "password" into password fields
		When I press "submit"
        	Then the profile page of "Someuser2" is loaded

	Scenario: New user attempts to register with invalid information
		Given I am a new user
		And I load the signup page
		And I fill in "user_email" with "invalid_test.com"
		And I fill in "user_name" with "Whatever"
		And the user inputs "2sml" into password fields
		When I press "submit"
		Then the signup page is loaded