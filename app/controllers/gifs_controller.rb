class GifsController < ApplicationController
  before_action :set_gif, only: %i[ show edit update destroy ]

  # GET /gifs or /gifs.json
  def index
    @gifs = Gif.all
  end

  # GET /gifs/1 or /gifs/1.json
  def show
  end

  # GET /gifs/new
  def new
    @gif = Gif.new
  end

  # GET /gifs/1/edit
  def edit
  end

  # POST /gifs or /gifs.json
  def create
    @gif = Gif.new(gif_params)

    respond_to do |format|
      if @gif.save
        format.html { redirect_to gif_url(@gif), notice: "Gif was successfully created." }
        format.json { render :show, status: :created, location: @gif }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifs/1 or /gifs/1.json
  def update
    respond_to do |format|
      if @gif.update(gif_params)
        format.html { redirect_to gif_url(@gif), notice: "Gif was successfully updated." }
        format.json { render :show, status: :ok, location: @gif }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifs/1 or /gifs/1.json
  def destroy
    @gif.destroy

    respond_to do |format|
      format.html { redirect_to gifs_url, notice: "Gif was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gif
      @gif = Gif.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gif_params
      params.fetch(:gif, {})
    end
end
