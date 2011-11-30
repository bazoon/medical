require 'test_helper'

class Ref::InsCompaniesControllerTest < ActionController::TestCase
  setup do
    @ref_ins_company = FactoryGirl.create(:ins_company)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ref_ins_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ref_ins_company" do
    assert_difference('Ref::InsCompany.count') do
      post :create, ref_ins_company: @ref_ins_company.attributes
    end

    assert_redirected_to ref_ins_companies_path
  end

  test "should get edit" do
    get :edit, id: @ref_ins_company.to_param
    assert_response :success
  end

  test "should update ref_ins_company" do
    put :update, id: @ref_ins_company.to_param, ref_ins_company: @ref_ins_company.attributes
    assert_redirected_to ref_ins_companies_path
  end

  test "should destroy ref_ins_company" do
    assert_difference('Ref::InsCompany.count', -1) do
      delete :destroy, id: @ref_ins_company.to_param
    end

    assert_redirected_to ref_ins_companies_path
  end
end
