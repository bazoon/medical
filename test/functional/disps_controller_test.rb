require 'test_helper'

class DispsControllerTest < ActionController::TestCase
  setup do
    @disp = FactoryGirl.create(:disp)
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:disps)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create disp" do
    assert_difference('Disp.count') do
      post :create, disp: @disp.attributes, :client_id => @client
    end

    assert_redirected_to client_disps_path
  end


  test "should get edit" do
    get :edit, id: @disp.to_param, :client_id => @client
    assert_response :success
  end

  test "should update disp" do
    put :update, id: @disp.to_param, disp: @disp.attributes, :client_id => @client
    assert_redirected_to client_disps_path
  end

  test "should destroy disp" do
    assert_difference('Disp.count', -1) do
      delete :destroy, id: @disp.to_param, :client_id => @client
    end

    assert_redirected_to client_disps_path
  end
end
