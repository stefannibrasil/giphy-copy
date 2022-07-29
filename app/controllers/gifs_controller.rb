class GifsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_gif, only: %i[ show edit update destroy ]
  before_action :require_ownership, only: %i[ edit update destroy ]

  # GET /gifs or /gifs.json
  def index
    @gifs = Gif.all
  end

  # GET /gifs/1 or /gifs/1.json
  def show
  end

  # GET /gifs/new
  def new
    @gif = current_user.gifs.build
  end

  # GET /gifs/1/edit
  def edit
  end

  # POST /gifs or /gifs.json
  def create
    @gif = current_user.gifs.new(gif_params)

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
    def require_ownership
      raise "Must be the owner to access this page" unless current_user == @gif.user
    end

    def set_gif
      @gif = Gif.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gif_params
      params.require(:gif).permit(:image)
    end
end
