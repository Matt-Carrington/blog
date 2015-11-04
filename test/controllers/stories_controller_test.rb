require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get _form" do
    get :_form
    assert_response :success
  end

end
