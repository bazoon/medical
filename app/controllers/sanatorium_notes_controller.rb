class SanatoriumNotesController < ApplicationController
  # GET /sanatorium_notes
  # GET /sanatorium_notes.json
  
  before_filter :find_client

  def find_client
    @client=Client.find(params[:client_id])
  end
  
  
  def index
    @sanatorium_notes = @client.sanatorium_notes


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sanatorium_notes }
    end
  end

  # GET /sanatorium_notes/1
  # GET /sanatorium_notes/1.json
  def show
    @sanatorium_note = SanatoriumNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sanatorium_note }
    end
  end

  # GET /sanatorium_notes/new
  # GET /sanatorium_notes/new.json
  def new
    @sanatorium_note = SanatoriumNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sanatorium_note }
    end
  end

  # GET /sanatorium_notes/1/edit
  def edit
    @sanatorium_note = SanatoriumNote.find(params[:id])
  end

  # POST /sanatorium_notes
  # POST /sanatorium_notes.json
  def create
    @sanatorium_note = SanatoriumNote.new(params[:sanatorium_note])
    @sanatorium_note.client=@client

    respond_to do |format|
      if @sanatorium_note.save
        format.html { redirect_to client_sanatorium_notes_path(@client), notice: I18n.t(:record_created)}
        format.json { render json: @sanatorium_note, status: :created, location: @sanatorium_note }
      else
        format.html { render action: "new" }
        format.json { render json: @sanatorium_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sanatorium_notes/1
  # PUT /sanatorium_notes/1.json
  def update
    @sanatorium_note = SanatoriumNote.find(params[:id])

    respond_to do |format|
      if @sanatorium_note.update_attributes(params[:sanatorium_note])
        format.html { redirect_to client_sanatorium_notes_path, notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @sanatorium_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sanatorium_notes/1
  # DELETE /sanatorium_notes/1.json
  def destroy
    @sanatorium_note = SanatoriumNote.find(params[:id])
    @sanatorium_note.destroy

    respond_to do |format|
      format.html { redirect_to client_sanatorium_notes_url }
      format.json { head :ok }
    end
  end
end
