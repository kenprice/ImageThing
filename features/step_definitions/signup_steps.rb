#User registered
Given(/^I am already registered$/) do
  visit "http://localhost:3000/logout"			#First, log out.

  @current_user = User.create!(:email => 'user@fake.com', :name => 'fakeuser', :password => 'password', :password_confirmation => 'password')
  
  visit "http://localhost:3000" #Home page

  #Fill out login form, then log in
  fill_in("session_email", :with => @current_user.email)
  fill_in("session_password", :with => @current_user.password)
  click_button("submit")

  #Should now be in profile page, logged in
end

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
  fill_in("Password", with: password, :match => :prefer_exact)
  fill_in("Password confirmation", with: password, :match => :prefer_exact)

	#Use this if above doesn't work:
	#find("#user_password").set(password + "\t" + password + "\r")
end
