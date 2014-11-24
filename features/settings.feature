Feature: A user that is logged in can change their user profile information and change their avatar.

		Scenario: User changes name and bio information on their profile.
			Given I am logged in as a user
			When I click on Settings link
			Then the Settings page is loaded
			
			When I fill in the Settings page with new name and new bio
			Then the change to name and bio should be shown in profile

		Scenario: User changes password and logs in later with new password.
			Given I am logged in as a user
			When I click on Settings link
			Then the Settings page is loaded
			
			When I fill in the Settings page with new password then log out
			And I navigate to Log In page and enter my new password
			Then the profile page is loaded

		Scenario: User uploads a new avatar.
			Given I am logged in as a user
			When I click on Settings link
			Then the Settings page is loaded
			
			When I select a new avatar and save changes
			Then the new avatar should be shown in profile