require 'test_helper'

class HtmHelpNotesControllerTest < ActionController::TestCase

  setup do
    @htm_help_note = FactoryGirl.create(:htm_help_note)
    @client = FactoryGirl.create(:client)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:htm_help_notes)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create htm_help_note" do
    assert_difference('HtmHelpNote.count') do
      post :create, htm_help_note: @htm_help_note.attributes, :client_id => @client
    end

    assert_redirected_to client_htm_help_notes_path
  end

  test "should get edit" do
    get :edit, id: @htm_help_note.to_param, :client_id => @client
    assert_response :success
  end

  test "should update htm_help_note" do
    put :update, id: @htm_help_note.to_param, htm_help_note: @htm_help_note.attributes, :client_id => @client
    assert_redirected_to client_htm_help_notes_path
  end

  test "should destroy htm_help_note" do
    assert_difference('HtmHelpNote.count', -1) do
      delete :destroy, id: @htm_help_note.to_param, :client_id => @client
    end

    assert_redirected_to client_htm_help_notes_path
  end
end
