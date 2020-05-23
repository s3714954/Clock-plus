require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:uncategorized)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get not new" do
    assert_raises(ActionController::RoutingError) {
      get "/category/new"
    }
  end

  test "should not create category" do
    assert_raises(ActionController::RoutingError) {
      post categories_url, params: { category: { name: @category.name } }
    }
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should not get edit" do
    assert_raises(ActionController::RoutingError) {      
      get "/category/#{@category.id}/edit"
    }
  end

  test "should not update category" do
    assert_raises(ActionController::RoutingError) {
      patch category_url(@category), params: { category: { name: @category.name } }
    }
  end

  test "should not destroy category" do
    assert_raises(ActionController::RoutingError) {
      delete category_url(@category)
    }
  end

end
