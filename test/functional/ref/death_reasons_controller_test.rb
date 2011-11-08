require 'test_helper'

class Ref::DeathReasonsControllerTest < ActionController::TestCase
  setup do
    @ref_death_reason = ref_death_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_death_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_death_reason" do
    assert_difference('Ref::DeathReason.count') do
      post :create, ref_death_reason: @ref_death_reason.attributes
    end

    assert_redirected_to ref_death_reason_path(assigns(:ref_death_reason))
  end

  test "should show ref_death_reason" do
    get :show, id: @ref_death_reason.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_death_reason.to_param
    assert_response :success
  end

  test "should update ref_death_reason" do
    put :update, id: @ref_death_reason.to_param, ref_death_reason: @ref_death_reason.attributes
    assert_redirected_to ref_death_reason_path(assigns(:ref_death_reason))
  end

  test "should destroy ref_death_reason" do
    assert_difference('Ref::DeathReason.count', -1) do
      delete :destroy, id: @ref_death_reason.to_param
    end

    assert_redirected_to ref_death_reasons_path
  end
end
