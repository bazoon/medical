require 'test_helper'

class BenefitsControllerTest < ActionController::TestCase
 setup do
   @client = FactoryGirl.create(:client)
   @benefit = FactoryGirl.create(:benefit,:client_id => @client)
  end
 
  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:benefits)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create benefit" do
    assert_difference('Benefit.count') do
      post :create, benefit: @benefit.attributes, :client_id => @client
    end

    assert_redirected_to client_benefits_path
  end


  test "should get edit" do
    get :edit, id: @benefit.to_param, :client_id => @client
    assert_response :success
  end

  test "should update benefit" do
    put :update, id: @benefit.to_param, benefit: @benefit.attributes, :client_id => @client
    assert_redirected_to client_benefits_path
  end

  test "should destroy benefit" do
    assert_difference('Benefit.count', -1) do
      delete :destroy, id: @benefit.to_param, :client_id => @client
    end

    assert_redirected_to client_benefits_path
  end
end
