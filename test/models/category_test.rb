require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Category Name")
  end

  test "should have name" do
    @category.name = nil
    assert_not @category.valid?
    @category.name = ""
    assert_not @category.valid?
    @category.name = "Actual Name"
    assert @category.valid?
  end
end
