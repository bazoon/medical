require 'test_helper'

class MkbsControllerTest < ActionController::TestCase
  setup do
    @mkb = FactoryGirl.create(:mkb)  
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:mkbs)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create mkb" do
    assert_difference('Mkb.count') do
      post :create, mkb: @mkb.attributes, :client_id => @client
    end

    assert_redirected_to client_mkbs_path
  end


  test "should get edit" do
    get :edit, id: @mkb.to_param, :client_id => @client
    assert_response :success
  end

  test "should update mkb" do
    put :update, id: @mkb.to_param, mkb: @mkb.attributes, :client_id => @client
    assert_redirected_to client_mkbs_path
  end

  test "should destroy mkb" do
    assert_difference('Mkb.count', -1) do
      delete :destroy, id: @mkb.to_param, :client_id => @client
    end

    assert_redirected_to client_mkbs_path
  end
end
