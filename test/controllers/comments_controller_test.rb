require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:comment1)
    @post = posts(:post1)
    @user = users(:michael)
  end

  test "should not get index" do
    assert_raises(ActionController::RoutingError) {
      get "/comments/"
    }
  end

  test "should not get new" do
    assert_raises(ActionController::RoutingError) {
      get "/comments/new"
    }
  end

  test "should create comment on post" do
    log_in_as @user
    assert_difference('Comment.count') do
      post "#{posts_url}/#{@post.id}", params: { comment: { content: @comment.content } }
    end

    assert_redirected_to @post
  end

  test "should not create comment without log in" do
    assert_difference('Comment.count', 0) do
      post "#{posts_url}/#{@post.id}", params: { comment: { content: @comment.content } }
    end

    assert_redirected_to @post
  end

  test "should not create comment without post in route" do
    assert_raises(ActionController::RoutingError) {
      post "/comments/", params: { comment: { content: @comment.content } }
    }
  end

  test "should not show comment" do
    assert_raises(ActionController::RoutingError) {
      get comment_url(@comment)
    }
  end

  test "should not get edit" do
    assert_raises(ActionController::RoutingError) {
      get "/comments/#{@comment.id}/edit"
    }
  end

  test "should not update comment" do
    assert_raises(ActionController::RoutingError) {
      patch comment_url(@comment), params: { comment: { content: @comment.content, post_id: @comment.post_id, user_id: @comment.user_id } }
    }
  end

  test "should not destroy comment" do
    assert_raises(ActionController::RoutingError) {
      delete "/"
    }
  end

  private
  
  def comment_url(model) 
    "/comments/#{model.id}"
  end

end
