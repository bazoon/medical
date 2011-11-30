require 'test_helper'

class DiagnosesControllerTest < ActionController::TestCase

  setup do
    @diagnosis = FactoryGirl.create(:diagnosis)
    @prof_inspection = @diagnosis.prof_inspection
    @client = @prof_inspection.client
  end

# Индекс не используется !
#  test "should get index" do
#    get :index, :client_id => @client.id, :prof_inspection_id => @prof_inspection
#
#    assert_response :success
#    assert_not_nil assigns(:diagnoses)
#  end

  test "should get new" do
    get :new, :client_id => @client.id, :prof_inspection_id => @prof_inspection
    assert_response :success
  end

  test "should create diagnosis" do
    assert_difference('Diagnosis.count') do
      post :create, diagnosis: @diagnosis.attributes, :client_id => @client.id, :prof_inspection_id => @prof_inspection
    end

    assert_redirected_to client_prof_inspections_path(@client.id)
  end

#  test "should show diagnosis" do
#    get :show, id: @diagnosis.to_param, :client_id => @client.id, :prof_inspection_id => @prof_inspection
#    assert_response :success
#  end

  test "should get edit" do
    get :edit, id: @diagnosis.to_param, :client_id => @client.id, :prof_inspection_id => @prof_inspection
    assert_response :success
  end

  test "should update diagnosis" do
    put :update, id: @diagnosis.to_param, diagnosis: @diagnosis.attributes, :client_id => @client.id, :prof_inspection_id => @prof_inspection
    assert_redirected_to client_prof_inspections_path
  end

  test "should destroy diagnosis" do
    assert_difference('Diagnosis.count', -1) do
      delete :destroy, id: @diagnosis.to_param, :client_id => @client, :prof_inspection_id => @prof_inspection
    end
    assert_redirected_to client_prof_inspections_path
  end

end
