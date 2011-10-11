require 'test_helper'

class SanatoriumNotesControllerTest < ActionController::TestCase

  setup do
    @sanatorium_note = sanatorium_notes(:one)
    @client = clients(:one)
  end

  test "should get index" do
    get :index, :client_id => @client
    assert_response :success
    assert_not_nil assigns(:sanatorium_notes)
  end

  test "should get new" do
    get :new, :client_id => @client
    assert_response :success
  end

  test "should create sanatorium_note" do
    assert_difference('SanatoriumNote.count') do
      post :create, sanatorium_note: @sanatorium_note.attributes, :client_id => @client
    end

    assert_redirected_to client_sanatorium_notes_path
  end

  test "should get edit" do
    get :edit, id: @sanatorium_note.to_param, :client_id => @client
    assert_response :success
  end

  test "should update sanatorium_note" do
    put :update, id: @sanatorium_note.to_param, sanatorium_note: @sanatorium_note.attributes, :client_id => @client
    assert_redirected_to client_sanatorium_notes_path
  end

  test "should destroy sanatorium_note" do
    assert_difference('SanatoriumNote.count', -1) do
      delete :destroy, id: @sanatorium_note.to_param, :client_id => @client
    end

    assert_redirected_to client_sanatorium_notes_path
  end
end
