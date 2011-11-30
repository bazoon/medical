require 'test_helper'

class MedDiagnosticTestsControllerTest < ActionController::TestCase

  setup do
    @med_diagnostic_test = FactoryGirl.create(:med_diagnostic_test)
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:med_diagnostic_tests)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create med_diagnostic_test" do
    assert_difference('MedDiagnosticTest.count') do
      post :create, med_diagnostic_test: @med_diagnostic_test.attributes, :client_id => @client
    end

    assert_redirected_to client_med_diagnostic_tests_path
  end

  test "should get edit" do
    get :edit, id: @med_diagnostic_test.to_param, :client_id => @client
    assert_response :success
  end

  test "should update med_diagnostic_test" do
    put :update, id: @med_diagnostic_test.to_param, med_diagnostic_test: @med_diagnostic_test.attributes, :client_id => @client
    assert_redirected_to client_med_diagnostic_tests_path
  end

  test "should destroy med_diagnostic_test" do
    assert_difference('MedDiagnosticTest.count', -1) do
      delete :destroy, id: @med_diagnostic_test.to_param, :client_id => @client
    end

    assert_redirected_to client_med_diagnostic_tests_path
  end
end
