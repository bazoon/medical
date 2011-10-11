require 'test_helper'

class Ref::HospitalizationTypesControllerTest < ActionController::TestCase
  setup do
    @ref_hospitalization_type = ref_hospitalization_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_hospitalization_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_hospitalization_type" do
    assert_difference('Ref::HospitalizationType.count') do
      post :create, ref_hospitalization_type: @ref_hospitalization_type.attributes
    end

    assert_redirected_to ref_hospitalization_types_path
  end

  test "should get edit" do
    get :edit, id: @ref_hospitalization_type.to_param
    assert_response :success
  end

  test "should update ref_hospitalization_type" do
    put :update, id: @ref_hospitalization_type.to_param, ref_hospitalization_type: @ref_hospitalization_type.attributes
    assert_redirected_to ref_hospitalization_types_path
  end

  test "should destroy ref_hospitalization_type" do
    assert_difference('Ref::HospitalizationType.count', -1) do
      delete :destroy, id: @ref_hospitalization_type.to_param
    end

    assert_redirected_to ref_hospitalization_types_path
  end
end
