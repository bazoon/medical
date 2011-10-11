require 'test_helper'

class DiagnosticTestsControllerTest < ActionController::TestCase

  setup do
    @diagnostic_test = diagnostic_tests(:one)
    @client = clients(:one)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:diagnostic_tests)
  end

  test "should get new" do
    get :new, :client_id => @client

    assert_response :success
  end

  test "should create diagnostic_test" do
    assert_difference('DiagnosticTest.count') do
      post :create, diagnostic_test: @diagnostic_test.attributes,:client_id => @client

    end

    assert_redirected_to client_diagnostic_tests_path(assigns(:client))
  end


  test "should get edit" do
    get :edit, id: @diagnostic_test.to_param,:client_id => @client
    assert_response :success
  end

  test "should update diagnostic_test" do
    put :update, id: @diagnostic_test.to_param, diagnostic_test: @diagnostic_test.attributes,:client_id => @client
    assert_redirected_to client_diagnostic_tests_path(assigns(:client))
  end

  test "should destroy diagnostic_test" do
    assert_difference('DiagnosticTest.count', -1) do
      delete :destroy, id: @diagnostic_test.to_param,:client_id => @client
    end

    assert_redirected_to client_diagnostic_tests_path
  end
end
