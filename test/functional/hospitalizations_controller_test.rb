require 'test_helper'

class HospitalizationsControllerTest < ActionController::TestCase

  setup do
    @hospitalization = FactoryGirl.create(:hospitalization)   #hospitalizations(:one)
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:hospitalizations)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create hospitalization" do
    assert_difference('Hospitalization.count') do
      post :create, hospitalization: @hospitalization.attributes, :client_id => @client
    end
    assert_redirected_to client_hospitalizations_path
  end

  test "should get edit" do
    get :edit, id: @hospitalization.to_param, :client_id => @client
    assert_response :success
  end

  test "should update hospitalization" do
    put :update, id: @hospitalization.to_param, hospitalization: @hospitalization.attributes, :client_id => @client
    assert_redirected_to client_hospitalizations_path
  end

  test "should destroy hospitalization" do
    assert_difference('Hospitalization.count', -1) do
      delete :destroy, id: @hospitalization.to_param, :client_id => @client
    end

    assert_redirected_to client_hospitalizations_path
  end
end
