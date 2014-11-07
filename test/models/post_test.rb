require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:ken)
    # This code is not idiomatically correct.
    @post = @user.posts.build(title: "Lorem ipsum", caption: "something or other")
    
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "most recent posts first" do
    assert_equal Post.first, posts(:most_recent)
  end

  test "title should be present" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "title should be at most 200 characters" do
    @post.title = "a" * 201
    assert_not @post.valid?
  end
end
