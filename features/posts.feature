Feature: A new user goes to registration page and enters valid information (e-mail, password, password confirm, etc.).
User successfully registers and is automatically redirected to his profile page.

		Scenario: User logs in and navigates to My Photos page, then Upload Photo page.
			Given I am logged in as a user
      And I navigate to My Photos page
			Then the My Photos page is loaded
			
			When I click "Upload Photo"
			Then the New Post page is loaded

		Scenario: User uploads a photo.
			Given I am logged in as a user
      And I choose to Upload Photo
			Then the New Post page is loaded
			
			When I select a valid photo and submit a post
			Then the post should have been successful

		Scenario: User clicks on an uploaded photo and goes to edit it.
			Given I am logged in as a user
			And I had already uploaded a photo
      And I navigate to My Photos page
			Then the My Photos page is loaded

			When I click on the first image and click Edit
			Then the Edit Photo page is loaded
			
			Given I submit a new title and new caption
			Then the post should show new title and caption

		Scenario: User clicks on an uploaded photo and goes to edit the brightness.
			Given I am logged in as a user
			And I had already uploaded a photo
      And I navigate to My Photos page
			Then the My Photos page is loaded
			
			When I click on the first image and click Edit
			Then the Edit Photo page is loaded
			
			When I click Edit Brightness
			Then the Edit Brightness page is loaded			