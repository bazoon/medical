require 'test_helper'

class Ref::HtmHelpTypesControllerTest < ActionController::TestCase
  setup do
    @ref_htm_help_type = FactoryGirl.create(:htm_help_type)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_htm_help_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_htm_help_type" do
    assert_difference('Ref::HtmHelpType.count') do
      post :create, ref_htm_help_type: @ref_htm_help_type.attributes
    end

    assert_redirected_to ref_htm_help_types_path
  end


  test "should get edit" do
    get :edit, id: @ref_htm_help_type.to_param
    assert_response :success
  end

  test "should update ref_htm_help_type" do
    put :update, id: @ref_htm_help_type.to_param, ref_htm_help_type: @ref_htm_help_type.attributes
    assert_redirected_to ref_htm_help_types_path
  end

  test "should destroy ref_htm_help_type" do
    assert_difference('Ref::HtmHelpType.count', -1) do
      delete :destroy, id: @ref_htm_help_type.to_param
    end

    assert_redirected_to ref_htm_help_types_path
  end
end
