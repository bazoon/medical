require 'test_helper'

class Ref::DoctorTypesControllerTest < ActionController::TestCase
  setup do
    @ref_doctor_type = ref_doctor_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_doctor_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_doctor_type" do
    assert_difference('Ref::DoctorType.count') do
      post :create, ref_doctor_type: @ref_doctor_type.attributes
    end

    assert_redirected_to ref_doctor_types_path
  end


  test "should get edit" do
    get :edit, id: @ref_doctor_type.to_param
    assert_response :success
  end

  test "should update ref_doctor_type" do
    put :update, id: @ref_doctor_type.to_param, ref_doctor_type: @ref_doctor_type.attributes
    assert_redirected_to ref_doctor_types_path
  end

  test "should destroy ref_doctor_type" do
    assert_difference('Ref::DoctorType.count', -1) do
      delete :destroy, id: @ref_doctor_type.to_param
    end

    assert_redirected_to ref_doctor_types_path
  end
end
