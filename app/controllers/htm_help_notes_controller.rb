class HtmHelpNotesController < ApplicationController
  # GET /htm_help_notes
  # GET /htm_help_notes.json
  before_filter :find_client
  
  def find_client
    @client=Client.find(params[:client_id])
  end

  def index
    @htm_help_notes = @client.htm_help_notes


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @htm_help_notes }
    end
  end

  # GET /htm_help_notes/1
  # GET /htm_help_notes/1.json
  def show
    @htm_help_note = HtmHelpNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @htm_help_note }
    end
  end

  # GET /htm_help_notes/new
  # GET /htm_help_notes/new.json
  def new
    @htm_help_note = HtmHelpNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @htm_help_note }
    end
  end

  # GET /htm_help_notes/1/edit
  def edit
    @htm_help_note = HtmHelpNote.find(params[:id])
  end

  # POST /htm_help_notes
  # POST /htm_help_notes.json
  def create
    @htm_help_note = HtmHelpNote.new(params[:htm_help_note])
    @htm_help_note.client=@client

    respond_to do |format|
      if @htm_help_note.save
        format.html { redirect_to client_htm_help_notes_path(@client), notice: I18n.t(:record_created) }
        format.json { render json: @htm_help_note, status: :created, location: @htm_help_note }
      else
        format.html { render action: "new" }
        format.json { render json: @htm_help_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /htm_help_notes/1
  # PUT /htm_help_notes/1.json
  def update
    @htm_help_note = HtmHelpNote.find(params[:id])

    respond_to do |format|
      if @htm_help_note.update_attributes(params[:htm_help_note])
        format.html { redirect_to client_htm_help_notes_path(@client), notice: I18n.t(:record_updated)}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @htm_help_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /htm_help_notes/1
  # DELETE /htm_help_notes/1.json
  def destroy
    @htm_help_note = HtmHelpNote.find(params[:id])
    @htm_help_note.destroy

    respond_to do |format|
      format.html { redirect_to client_htm_help_notes_url(@client) }
      format.json { head :ok }
    end
  end
end
