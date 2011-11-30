require 'test_helper'

class MsesControllerTest < ActionController::TestCase
  setup do
    @mse = FactoryGirl.create(:mse)  
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client

    assert_response :success
    assert_not_nil assigns(:mses)
  end

  test "should get new" do
    get :new, :client_id => @client

    assert_response :success
  end

  test "should create mse" do
    assert_difference('Mse.count') do
      post :create, mse: @mse.attributes, :client_id => @client

    end

    assert_redirected_to client_mses_path
  end

  test "should show mse" do
    get :show, id: @mse.to_param, :client_id => @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mse.to_param, :client_id => @client
    assert_response :success
  end

  test "should update mse" do
    put :update, id: @mse.to_param, mse: @mse.attributes, :client_id => @client
    assert_redirected_to client_mses_path
  end

  test "should destroy mse" do
    assert_difference('Mse.count', -1) do
      delete :destroy, id: @mse.to_param, :client_id => @client
    end

    assert_redirected_to client_mses_path
  end
end
