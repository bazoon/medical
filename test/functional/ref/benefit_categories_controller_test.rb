require 'test_helper'

class Ref::BenefitCategoriesControllerTest < ActionController::TestCase
  setup do
    @ref_benefit_category = Factory.create(:benefit_category)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_benefit_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_benefit_category" do
    assert_difference('Ref::BenefitCategory.count') do
      post :create, ref_benefit_category: @ref_benefit_category.attributes
    end

    assert_redirected_to ref_benefit_categories_path
  end

  test "should show ref_benefit_category" do
    get :show, id: @ref_benefit_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ref_benefit_category.to_param
    assert_response :success
  end

  test "should update ref_benefit_category" do
    put :update, id: @ref_benefit_category.to_param, ref_benefit_category: @ref_benefit_category.attributes
    assert_redirected_to ref_benefit_categories_path
  end

  test "should destroy ref_benefit_category" do
    assert_difference('Ref::BenefitCategory.count', -1) do
      delete :destroy, id: @ref_benefit_category.to_param
    end

    assert_redirected_to ref_benefit_categories_path
  end
end
