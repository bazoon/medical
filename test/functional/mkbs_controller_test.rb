require 'test_helper'

class MkbsControllerTest < ActionController::TestCase
  setup do
    @mkb = mkbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mkbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mkb" do
    assert_difference('Mkb.count') do
      post :create, mkb: @mkb.attributes
    end

    assert_redirected_to mkb_path(assigns(:mkb))
  end

  test "should show mkb" do
    get :show, id: @mkb.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mkb.to_param
    assert_response :success
  end

  test "should update mkb" do
    put :update, id: @mkb.to_param, mkb: @mkb.attributes
    assert_redirected_to mkb_path(assigns(:mkb))
  end

  test "should destroy mkb" do
    assert_difference('Mkb.count', -1) do
      delete :destroy, id: @mkb.to_param
    end

    assert_redirected_to mkbs_path
  end
end
