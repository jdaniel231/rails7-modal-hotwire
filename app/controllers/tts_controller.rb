class TtsController < ApplicationController
  before_action :set_tt, only: %i[ show edit update destroy ]

  # GET /tts or /tts.json
  def index
    @tts = Tt.all
  end

  # GET /tts/1 or /tts/1.json
  def show
  end

  # GET /tts/new
  def new
    @tt = Tt.new
  end

  # GET /tts/1/edit
  def edit
  end

  # POST /tts or /tts.json
  def create
    @tt = Tt.new(tt_params)

    respond_to do |format|
      if @tt.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('tts', partial: 'tts/tt', locals: {tt: @tt}) }
        format.html { redirect_to tt_url(@tt), notice: "Tt was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tts/1 or /tts/1.json
  def update
    respond_to do |format|
      if @tt.update(tt_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace('tts', partial: 'tts/tt', locals: {tt: @tt}) }
        format.html { redirect_to tt_url(@tt), notice: "Tt was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tts/1 or /tts/1.json
  def destroy
    @tt.destroy

    respond_to do |format|
      format.html { redirect_to tts_url, notice: "Tt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tt
      @tt = Tt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tt_params
      params.require(:tt).permit(:name, :status, :description, :message, :id_company, :holiday, :start_date, :end_date)
    end
end
