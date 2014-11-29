require 'test_helper'

class ManhoursControllerTest < ActionController::TestCase
  setup do
    @manhour = manhours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manhours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manhour" do
    assert_difference('Manhour.count') do
      post :create, manhour: { heading: @manhour.heading, union147: @manhour.union147, union15: @manhour.union15 }
    end

    assert_redirected_to manhour_path(assigns(:manhour))
  end

  test "should show manhour" do
    get :show, id: @manhour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manhour
    assert_response :success
  end

  test "should update manhour" do
    patch :update, id: @manhour, manhour: { heading: @manhour.heading, union147: @manhour.union147, union15: @manhour.union15 }
    assert_redirected_to manhour_path(assigns(:manhour))
  end

  test "should destroy manhour" do
    assert_difference('Manhour.count', -1) do
      delete :destroy, id: @manhour
    end

    assert_redirected_to manhours_path
  end
end
