require 'test_helper'

class Ref::DeseaseTypesControllerTest < ActionController::TestCase
  setup do
    @ref_desease_type = ref_desease_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_desease_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_desease_type" do
    assert_difference('Ref::DeseaseType.count') do
      post :create, ref_desease_type: @ref_desease_type.attributes
    end

    assert_redirected_to ref_desease_types_path
  end


  test "should get edit" do
    get :edit, id: @ref_desease_type.to_param
    assert_response :success
  end

  test "should update ref_desease_type" do
    put :update, id: @ref_desease_type.to_param, ref_desease_type: @ref_desease_type.attributes
    assert_redirected_to ref_desease_types_path
  end

  test "should destroy ref_desease_type" do
    assert_difference('Ref::DeseaseType.count', -1) do
      delete :destroy, id: @ref_desease_type.to_param
    end

    assert_redirected_to ref_desease_types_path
  end
end
