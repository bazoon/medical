require 'test_helper'

class Ref::MedDiagnosticTestTypesControllerTest < ActionController::TestCase
  setup do
    @ref_med_diagnostic_test_type = FactoryGirl.create(:med_diagnostic_test_type)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_med_diagnostic_test_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_med_diagnostic_test_type" do
    assert_difference('Ref::MedDiagnosticTestType.count') do
      post :create, ref_med_diagnostic_test_type: @ref_med_diagnostic_test_type.attributes
    end

    assert_redirected_to ref_med_diagnostic_test_types_path
  end


  test "should get edit" do
    get :edit, id: @ref_med_diagnostic_test_type.to_param
    assert_response :success
  end

  test "should update ref_med_diagnostic_test_type" do
    put :update, id: @ref_med_diagnostic_test_type.to_param, ref_med_diagnostic_test_type: @ref_med_diagnostic_test_type.attributes
    assert_redirected_to ref_med_diagnostic_test_types_path
  end

  test "should destroy ref_med_diagnostic_test_type" do
    assert_difference('Ref::MedDiagnosticTestType.count', -1) do
      delete :destroy, id: @ref_med_diagnostic_test_type.to_param
    end

    assert_redirected_to ref_med_diagnostic_test_types_path
  end
end
