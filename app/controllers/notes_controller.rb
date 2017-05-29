class NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /notes
  def index
    @notes = current_user.notes.order(created_at: :desc) + Note.all.publicly_available.order(created_at: :desc)

    render json: @notes 
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      @note.attachments.build
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    byebug
    if @note.update(note_params)
      #save the attachments
      if params[:note][:attachments]
        params[:note][:attachments].each { |key, file|
          @note.attachments.create(file: file)
        }
      end

      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:id, :title, :content)
    end
end
