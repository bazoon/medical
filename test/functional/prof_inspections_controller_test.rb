require 'test_helper'

class ProfInspectionsControllerTest < ActionController::TestCase
  setup do
    @prof_inspection = FactoryGirl.create(:prof_inspection)
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:prof_inspections)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create prof_inspection" do
    assert_difference('ProfInspection.count') do
      post :create, prof_inspection: @prof_inspection.attributes, :client_id => @client
    end

    assert_redirected_to client_prof_inspections_path
  end


  test "should get edit" do
    get :edit, id: @prof_inspection.to_param, :client_id => @client
    assert_response :success
  end

  test "should update prof_inspection" do
    put :update, id: @prof_inspection.to_param, prof_inspection: @prof_inspection.attributes, :client_id => @client
    assert_redirected_to client_prof_inspections_path
  end

  test "should destroy prof_inspection" do
    assert_difference('ProfInspection.count', -1) do
      delete :destroy, id: @prof_inspection.to_param, :client_id => @client
    end

    assert_redirected_to client_prof_inspections_path
  end
end
