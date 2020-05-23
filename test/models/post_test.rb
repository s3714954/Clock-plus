require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @category = categories(:uncategorized)
    @post = Post.new(
      title: "Model post", 
      content: "Something good",
      user: @user,
      category: @category,
      views: 0
    )
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should have content" do
    @post.content = ""
    assert_not @post.valid?
    @post.content = nil
    assert_not @post.valid?
    @post.content = "Content here"
    assert @post.valid?
  end

  test "should have user" do
    @post.user = nil
    assert_not @post.valid?
    @post.user = @user
    assert @post.valid?
  end

  test "should have category automatically (defaults to first one)" do
    @post.category = nil
    assert @post.valid?
    assert_equal Category.first, @post.category
    @post.category = @category
    assert @post.valid?
  end
  
end
