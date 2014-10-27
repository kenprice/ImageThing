require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:ken)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    #Unsuccessful edit expected behavior
    
    #attempt PATCH of user with junk params
    get edit_user_path(@user)
    patch user_path(@user), user: { name:  '',
                                    email: 'foo@invalid',
                                    password:              'foo',
                                    password_confirmation: 'bar' }
    
    #Should return edit page
    assert_template 'users/edit'
  end
  
  test "successful edit" do
    log_in_as(@user)
    
    get edit_user_path(@user)
    name = "Foo Bar"
    email = "foo@valid.com"
    
    patch user_path(@user), user: { name: name, 
                                    email: email,
                                    password:              '',
                                    password_confirmation: '' }
    
    assert_not flash.empty?       #success flash
    assert_redirected_to @user    #return to profile
    
    #reload user data from DB, check if changes written
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
  
  test "edit friendly forward" do
    #if logged out and user attempts to edit profile, will prompt for login
    #then redirct to profile edit page
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    
    name = "Foo Bar"
    email = "foo@valid.com"
    
    patch user_path(@user), user: { name: name, 
                                    email: email,
                                    password:              '',
                                    password_confirmation: '' }
    
    assert_not flash.empty?       #success flash
    assert_redirected_to @user    #return to profile
    
    #reload user data from DB, check if changes written
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end
