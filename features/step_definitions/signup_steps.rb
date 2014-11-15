Given(/^I load the signup page$/) do
  visit "http://localhost:3000/signup" 
end

Then(/^the profile page of "(.*?)" is loaded$/) do |user|
  page.should have_content(user)
end

Then(/^the signup page is loaded$/) do
  page.should have_content("Sign up")  
end

Given(/^the user inputs "(.*?)" into password fields$/) do |password|
	#This is a hacky workaround.
	#what this next line does is find element with id user_password
	#(user_password field in this case, see user/new.html.erb)
	#and then fill the field with password, hits Tab, enters password
	#again (should be confirmation field), then hits Enter.

	#The reason for this workaround is because Capybara failed to find
	#user_password_confirmation field. Even after the workaround to skip
	#that field, it couldn't find the submit button. The home page test
	#did not have this problem. So, it appears after a certain number of
	#elements, Capybara is having trouble finding fields on the signup page.

	#But hey, this works:
	#find("#user_password").set(password + "\t" + password + "\r")
  
  #This doesn't work:
  fill_in("Password", with: password, :match => :prefer_exact)
  fill_in("Password confirmation", with: password, :match => :prefer_exact)
end
