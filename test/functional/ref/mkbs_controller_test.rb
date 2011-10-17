require 'test_helper'

class Ref::MkbsControllerTest < ActionController::TestCase
  setup do
    @ref_mkb = ref_mkbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_mkbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_mkb" do
    assert_difference('Ref::Mkb.count') do
      post :create, ref_mkb: @ref_mkb.attributes
    end

    assert_redirected_to ref_mkb_path(assigns(:ref_mkb))
  end

  test "should show ref_mkb" do
    get :show, id: @ref_mkb.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_mkb.to_param
    assert_response :success
  end

  test "should update ref_mkb" do
    put :update, id: @ref_mkb.to_param, ref_mkb: @ref_mkb.attributes
    assert_redirected_to ref_mkb_path(assigns(:ref_mkb))
  end

  test "should destroy ref_mkb" do
    assert_difference('Ref::Mkb.count', -1) do
      delete :destroy, id: @ref_mkb.to_param
    end

    assert_redirected_to ref_mkbs_path
  end
end
