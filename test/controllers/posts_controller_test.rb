require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:michael)
    @category = categories(:uncategorized)
    @post = posts(:post1)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new when logged in" do
    log_in_as(@user)
    get new_post_url
    assert_response :success
  end

  test "should not get new when logged in" do
    get new_post_url
    assert_redirected_to "/login"
  end

  test "should create post" do
    log_in_as(@user)
    assert_difference('Post.count') do
      post posts_url, params: { post: { category_id: @category.id, content: @post.content, title: @post.title} }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should not get edit" do
    assert_raises(ActionController::RoutingError) {
      get "/posts/#{@post.id}/edit"
    }
  end

  test "should not update post" do
    assert_raises(ActionController::RoutingError) {
      patch post_url(@post), params: { post: { category_id: @post.category.id, content: @post.content, title: @post.title, user_id: @post.user.id } }
    }
  end

  test "should not destroy post" do
    assert_raises(ActionController::RoutingError) {
      delete post_url(@post)
    }
  end
end
