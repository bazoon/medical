require 'test_helper'

class ClientSexesControllerTest < ActionController::TestCase
  
  setup do
    @client_sex = FactoryGirl.create(:client_sex)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_sexes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_sex" do
    assert_difference('ClientSex.count') do
      post :create, client_sex: @client_sex.attributes
    end

    assert_redirected_to client_sex_path(assigns(:client_sex))
  end

  test "should show client_sex" do
    get :show, id: @client_sex.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_sex.to_param
    assert_response :success
  end

  test "should update client_sex" do
    put :update, id: @client_sex.to_param, client_sex: @client_sex.attributes
    assert_redirected_to client_sex_path(assigns(:client_sex))
  end

  test "should destroy client_sex" do
    assert_difference('ClientSex.count', -1) do
      delete :destroy, id: @client_sex.to_param
    end

    assert_redirected_to client_sexes_path
  end
end
