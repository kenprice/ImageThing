Feature: A new user goes to registration page and enters valid information (e-mail, password, password confirm, etc.).
User successfully registers and is automatically redirected to his profile page.

		Scenario: New user attempts to register with minimum valid information
				Given I am a new user
				And I load the signup page
        And I fill in "user_email" with "notauser@test.com"
        And I fill in "user_name" with "Someuser"
				And the user inputs "password" into password field
        Then the profile page of "Someuser" is loaded