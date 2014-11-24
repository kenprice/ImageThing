Given(/^I navigate to My Photos page$/)do
  visit "http://localhost:3000/users/" + @current_user.id.to_s + "/front"
end

Given(/^I choose to Upload Photo$/)do
  visit "http://localhost:3000/posts/new"
end

Then(/^the My Photos page is loaded$/) do
  page.should have_content("My Posts")  
end

Then(/^the New Post page is loaded$/) do
  page.should have_content("New Post")  
end

Then(/^the Edit Photo page is loaded$/) do
  page.should have_content("Edit Photo")  
end

When(/^I select a valid photo and submit a post$/) do
  attach_file(:post_photo, File.join(Rails.root, 'features', 'upload-files', 'validphoto.jpg'))
  fill_in("post_title", :with => "The Title")
	fill_in("post_caption", :with => "Check out this caption")
  click_button "Submit post"
end

Then (/^the post should have been successful$/)	do
  page.should have_no_content("New Post")  
end

Given (/^I had already uploaded a photo$/) do
  visit "http://localhost:3000/posts/new"
  attach_file(:post_photo, File.join(Rails.root, 'features', 'upload-files', 'validphoto.jpg'))
  fill_in("post_title", :with => "TestTitle")
	fill_in("post_caption", :with => "Check out this caption")
  click_button "Submit post"
end

#For use in testing user front or profile page
When(/^I click on the first image and click Edit$/) do
  #image name should be test
  find(:xpath, "//a/img[@alt='Validphoto']/..").click 
  find(:link,"Edit").click
end

When(/^I click Edit Brightness$/) do
  #image name should be test
  find(:link,"Edit Brightness").click
end

Then(/^the Edit Brightness page is loaded$/) do
  page.should have_content("Edit Brightness")  
end

Given (/^I submit a new title and new caption$/) do
  fill_in("post_title", :with => "newtitle")
	fill_in("post_caption", :with => "a new caption")
  click_button "Submit post"
end

Then (/^the post should show new title and caption$/)	do
  page.should have_content("newtitle")
  page.should have_content("a new caption")  
end