require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Foo Bar"
    email = "foo@bar.com"
    mobile_number = "123456789"
    patch user_path(@user), params: {  user:  {name: name,
                                               email: email,
                                               password: "",
                                               password_confirmation:  "" ,
                                               mobile_number: mobile_number} }
    assert_not flash.empty?
    assert_equal user_path(@user), path # redirected
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
    assert_equal mobile_number, @user.mobile_number
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: {name: @user.name,
                                      email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end