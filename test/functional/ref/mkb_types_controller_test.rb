require 'test_helper'

class Ref::MkbTypesControllerTest < ActionController::TestCase
  setup do
    @ref_mkb_type = ref_mkb_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_mkb_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_mkb_type" do
    assert_difference('Ref::MkbType.count') do
      post :create, ref_mkb_type: @ref_mkb_type.attributes
    end

    assert_redirected_to ref_mkb_type_path(assigns(:ref_mkb_type))
  end

  test "should show ref_mkb_type" do
    get :show, id: @ref_mkb_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_mkb_type.to_param
    assert_response :success
  end

  test "should update ref_mkb_type" do
    put :update, id: @ref_mkb_type.to_param, ref_mkb_type: @ref_mkb_type.attributes
    assert_redirected_to ref_mkb_type_path(assigns(:ref_mkb_type))
  end

  test "should destroy ref_mkb_type" do
    assert_difference('Ref::MkbType.count', -1) do
      delete :destroy, id: @ref_mkb_type.to_param
    end

    assert_redirected_to ref_mkb_types_path
  end
end
