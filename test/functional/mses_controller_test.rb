require 'test_helper'

class MsesControllerTest < ActionController::TestCase
  setup do
    @mse = mses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mse" do
    assert_difference('Mse.count') do
      post :create, mse: @mse.attributes
    end

    assert_redirected_to mse_path(assigns(:mse))
  end

  test "should show mse" do
    get :show, id: @mse.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mse.to_param
    assert_response :success
  end

  test "should update mse" do
    put :update, id: @mse.to_param, mse: @mse.attributes
    assert_redirected_to mse_path(assigns(:mse))
  end

  test "should destroy mse" do
    assert_difference('Mse.count', -1) do
      delete :destroy, id: @mse.to_param
    end

    assert_redirected_to mses_path
  end
end
