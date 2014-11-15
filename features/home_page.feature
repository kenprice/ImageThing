Feature: A new user comes to home page and fills the email and password to login. 
         But website returns the same home page as reply
 
    Scenario: New user tries to log in
        Given I am a new user
        And I load the home page
        And I fill in "session_email" with "notauser@test.com"
        And I fill in "session_password" with "passowrd"
        When I press "submit"
        Then the same home page is loaded

    Scenario: Newly registered user logs back in after logging out
				Given I am a new user
				And I load the signup page
        And I fill in "user_email" with "test1@test.com"
        And I fill in "user_name" with "Someuser"
				And the user inputs "password" into password fields
				When I press "submit"
        Then the profile page of "Someuser" is loaded
        Given I log out
        And I load the home page
        And I fill in "session_email" with "test1@test.com"
        And I fill in "session_password" with "password"
        When I press "submit"
        Then the profile page of "Someuser" is loaded