require 'test_helper'

class Ref::SanatoriaControllerTest < ActionController::TestCase
  setup do
    @ref_sanatorium = FactoryGirl.create(:sanatorium)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_sanatoria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_sanatorium" do
    assert_difference('Ref::Sanatorium.count') do
      post :create, ref_sanatorium: @ref_sanatorium.attributes
    end

    assert_redirected_to ref_sanatoria_path
  end

  test "should show ref_sanatorium" do
    get :show, id: @ref_sanatorium.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_sanatorium.to_param
    assert_response :success
  end

  test "should update ref_sanatorium" do
    put :update, id: @ref_sanatorium.to_param, ref_sanatorium: @ref_sanatorium.attributes
    assert_redirected_to ref_sanatoria_path
  end

  test "should destroy ref_sanatorium" do
    assert_difference('Ref::Sanatorium.count', -1) do
      delete :destroy, id: @ref_sanatorium.to_param
    end

    assert_redirected_to ref_sanatoria_path
  end
end
