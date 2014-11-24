#Logging in
Given(/^I am logged in as a user$/) do
  visit "http://localhost:3000/logout"			#First, log out.

  @current_user = User.create!(:email => 'user@fake.com', :name => 'fakeuser', :password => 'password', :password_confirmation => 'password')
  
  visit "http://localhost:3000" #Home page

  #Fill out login form, then log in
  fill_in("session_email", :with => @current_user.email)
  fill_in("session_password", :with => @current_user.password)
  click_button("submit")

  #Should now be in profile page, logged in
end

When (/^I navigate to Log In page and enter an email and password$/) do
  visit "http://localhost:3000/login" 

  #Fill out login form, then log in
  fill_in("session_email", :with => "notregistered@fake.com")
  fill_in("session_password", :with => "somepassword")
  click_button("submit")
end

When (/^I navigate to Log In page and enter my information$/) do
  visit "http://localhost:3000/login" 

  #Fill out login form, then log in
  fill_in("session_email", :with => @current_user.email)
  fill_in("session_password", :with => @current_user.password)
  click_button("submit")
end

Given (/^I log out$/) do
  visit "http://localhost:3000/logout" 
end

Then(/^the Log In page is loaded$/) do
  page.should have_content("Log In")  
end
