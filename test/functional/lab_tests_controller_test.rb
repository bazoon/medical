require 'test_helper'

class LabTestsControllerTest < ActionController::TestCase

  setup do
    @lab_test = lab_tests(:one)
    @lab_test.test_date = '01.01.2001'
    @lab_test.lab_test_type_id = 2
    @lab_test.result = "ok"
    @lab_test.client_id = 1
    @client = clients(:one)
  end

  test "should get index" do
    get :index,:client_id => @client
    assert_response :success
    assert_not_nil assigns(:lab_tests)
  end

  test "should get new" do
    get :new,:client_id => @client
    assert_response :success
  end

  test "should create lab_test" do
    
    assert_difference('LabTest.count') do
      post :create, lab_test: @lab_test.attributes,:client_id => @client
    end
    assert_redirected_to client_lab_tests_path(assigns(:client))
  end


  test "should get edit" do
    get :edit, id: @lab_test.to_param,:client_id => @client
    assert_response :success
  end

  test "should update lab_test" do
    put :update, id: @lab_test.to_param, lab_test: @lab_test.attributes,:client_id => @client
    assert_redirected_to client_lab_tests_path(assigns(:client))
  end

  test "should destroy lab_test" do
    assert_difference('LabTest.count', -1) do
      delete :destroy, id: @lab_test.to_param, :client_id => @client
    end

    assert_redirected_to client_lab_tests_path(assigns(:client))
  end

end
