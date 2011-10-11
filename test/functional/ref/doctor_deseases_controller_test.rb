require 'test_helper'

class Ref::DoctorDeseasesControllerTest < ActionController::TestCase
  setup do
    @ref_doctor_desease = ref_doctor_deseases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_doctor_deseases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_doctor_desease" do
    assert_difference('Ref::DoctorDesease.count') do
      post :create, ref_doctor_desease: @ref_doctor_desease.attributes
    end

    assert_redirected_to ref_doctor_deseases_path
  end

  test "should get edit" do
    get :edit, id: @ref_doctor_desease.to_param
    assert_response :success
  end

  test "should update ref_doctor_desease" do
    put :update, id: @ref_doctor_desease.to_param, ref_doctor_desease: @ref_doctor_desease.attributes
    assert_redirected_to ref_doctor_deseases_path
  end

  test "should destroy ref_doctor_desease" do
    assert_difference('Ref::DoctorDesease.count', -1) do
      delete :destroy, id: @ref_doctor_desease.to_param
    end

    assert_redirected_to ref_doctor_deseases_path
  end
end
