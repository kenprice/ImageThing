require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:ken)
    @other_user = users(:jordan)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_path
  end
  
  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_redirected_to login_path
  end
  
  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { email: @user.email, name: @user.name }
    assert_redirected_to login_path
  end
  
  test "should redirect when trying to edit another user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert_redirected_to root_url
  end
  
  test "should redirect when trying to update another user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { email: @user.email, name: @user.name }
    assert_redirected_to root_url
  end
  
  
  
  
end
