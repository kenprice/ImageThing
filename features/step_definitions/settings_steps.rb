When (/^I click on Settings link$/) do
	find(:link,"Settings").click
end

Then(/^the Settings page is loaded$/) do
  page.should have_content("Edit Profile")  
end

When (/^I fill in the Settings page with new name and new bio$/) do
  fill_in("user_name", :with => "newname")
	fill_in("user_profile_bio", :with => "newbio")
  click_button "Save Changes"
end

Then(/^the change to name and bio should be shown in profile$/) do
  page.should have_content("newname")
  page.should have_content("newbio") 
end

When (/^I fill in the Settings page with new password then log out$/) do
  fill_in("user_password", :with => "newpass")
	fill_in("user_password_confirmation", :with => "newpass")
  click_button "Save Changes"

  #Log out after
  visit "http://localhost:3000/logout" 
end

When (/^I navigate to Log In page and enter my new password$/) do
  visit "http://localhost:3000/login" 

  #Fill out login form, then log in
  fill_in("session_email", :with => @current_user.email)
  fill_in("session_password", :with => "newpass")
  click_button("submit")
end

When(/^I select a new avatar and save changes$/) do
  attach_file(:user_avatar, File.join(Rails.root, 'features', 'upload-files', 'someavatar.jpg'))
  click_button "Save Changes"
end

Then(/^the new avatar should be shown in profile$/) do
  page.should have_xpath("//img[@alt='Someavatar']")
end

