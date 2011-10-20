require 'test_helper'

class Ref::LabClinMinsControllerTest < ActionController::TestCase
  setup do
    @ref_lab_clin_min = ref_lab_clin_mins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_lab_clin_mins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_lab_clin_min" do
    assert_difference('Ref::LabClinMin.count') do
      post :create, ref_lab_clin_min: @ref_lab_clin_min.attributes
    end

    assert_redirected_to ref_lab_clin_min_path(assigns(:ref_lab_clin_min))
  end

  test "should show ref_lab_clin_min" do
    get :show, id: @ref_lab_clin_min.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_lab_clin_min.to_param
    assert_response :success
  end

  test "should update ref_lab_clin_min" do
    put :update, id: @ref_lab_clin_min.to_param, ref_lab_clin_min: @ref_lab_clin_min.attributes
    assert_redirected_to ref_lab_clin_min_path(assigns(:ref_lab_clin_min))
  end

  test "should destroy ref_lab_clin_min" do
    assert_difference('Ref::LabClinMin.count', -1) do
      delete :destroy, id: @ref_lab_clin_min.to_param
    end

    assert_redirected_to ref_lab_clin_mins_path
  end
end
