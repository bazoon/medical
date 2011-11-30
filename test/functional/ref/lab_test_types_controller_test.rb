require 'test_helper'

class Ref::LabTestTypesControllerTest < ActionController::TestCase
  setup do
    @ref_lab_test_type = FactoryGirl.create(:lab_test_type)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_lab_test_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_lab_test_type" do
    assert_difference('Ref::LabTestType.count') do
      post :create, ref_lab_test_type: @ref_lab_test_type.attributes
    end

    assert_redirected_to ref_lab_test_types_path
  end


  test "should get edit" do
    get :edit, id: @ref_lab_test_type.to_param
    assert_response :success
  end

  test "should update ref_lab_test_type" do
    put :update, id: @ref_lab_test_type.to_param, ref_lab_test_type: @ref_lab_test_type.attributes
    assert_redirected_to ref_lab_test_types_path
  end

  test "should destroy ref_lab_test_type" do
    assert_difference('Ref::LabTestType.count', -1) do
      delete :destroy, id: @ref_lab_test_type.to_param
    end

    assert_redirected_to ref_lab_test_types_path
  end
end
