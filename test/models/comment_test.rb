require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = posts(:post1)
    @comment = Comment.new(
      user: @user,
      post: @post,
      content: "Reply to a post"
    )
  end

  test "should have user" do
    @comment.user = nil
    assert_not @comment.valid?
    @comment.user = @user
    assert @comment.valid?
  end

  test "should have post" do
    @comment.post = nil
    assert_not @comment.valid?
    @comment.post = @post
    assert @comment.valid?
  end

  test "should have content" do
    @comment.content = nil
    assert_not @comment.valid?
    @comment.content = ""
    assert_not @comment.valid?
    @comment.content = "Actual content"
    assert @comment.valid?
  end

end
