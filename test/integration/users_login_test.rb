require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:ken)
  end
  
  test "valid login then log out" do
    get login_path
    post login_path, session: { email: @user.email, password: 'password' }
    
    #Should redirect to user path upon logging in
    assert_redirected_to @user
    #check if there's a new user session
    assert is_logged_in?
    #actually redirect
    follow_redirect!
    
    assert_template 'users/show'
    
    #login link should not be shown
    #logout and profile links should be shown
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    
    #DELETE method to logout path, check if session deleted
    delete logout_path
    assert_not is_logged_in?
    
    #should redirect to home
    assert_redirected_to root_url
    #actually redirect
    follow_redirect!
  
    #login link should be shown
    #logout and profile links should not be shown
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  
  test "invalid login then log out" do
    get login_path
    @user.email = "garbage"
    post login_path, session: { email: @user.email, password: 'password' }
    
    #Should render new login form
    assert_template 'sessions/new'
    #check if there's a new user session
    assert !is_logged_in?
    
    #login link should not be shown
    #logout and profile links should be shown
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end