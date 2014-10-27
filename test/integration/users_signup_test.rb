require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup entry" do
    get signup_path     #go to the path for user signup
    
    #check if User count had changed after invalid entry. User count shouldn't
    #increase after invalid entry
    assert_no_difference 'User.count' do
      post users_path, user: { email: "lies@invalid",
                               password:              "something",
                               password_confirmation: "else" }
    end
    
    #check if user/new template is returned. invalid signup should still return
    #to signup screen
    assert_template 'users/new'
  end

  test "valid sigup entry" do
    get signup_path
    email = "valid@truth.com"
    password = "validpass"
    
    #test if new user added
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { email: email,
                                            password: password, 
                                            password_confirmation: password }
    end
    
    #should go to user's profile page
    assert_template 'users/show'
    
    #verify user is logged in
    assert is_logged_in?
  end
end

