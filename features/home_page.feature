Feature: A new user comes to home page and fills the email and password to login. 
         But website returns the same home page as reply
 
    Scenario: New user tries login 
        Given I am a new user
        And I load the home page
        And I fill in "session_email" with "notauser@test.com"
        And I fill in "session_password" with "passowrd"
        When I press "submit"
        Then the same home page is loaded