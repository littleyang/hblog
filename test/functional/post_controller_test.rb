require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

  test "should get view" do
    get :view
    assert_response :success
  end

end
