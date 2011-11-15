require 'test_helper'

class DispsControllerTest < ActionController::TestCase
  setup do
    @disp = disps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disp" do
    assert_difference('Disp.count') do
      post :create, disp: @disp.attributes
    end

    assert_redirected_to disp_path(assigns(:disp))
  end

  test "should show disp" do
    get :show, id: @disp.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disp.to_param
    assert_response :success
  end

  test "should update disp" do
    put :update, id: @disp.to_param, disp: @disp.attributes
    assert_redirected_to disp_path(assigns(:disp))
  end

  test "should destroy disp" do
    assert_difference('Disp.count', -1) do
      delete :destroy, id: @disp.to_param
    end

    assert_redirected_to disps_path
  end
end
