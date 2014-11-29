class ManhoursController < ApplicationController
  before_action :set_manhour, only: [:show, :edit, :update, :destroy]

  # GET /manhours
  # GET /manhours.json
  def index
    @manhours = Manhour.all
  end

  # GET /manhours/1
  # GET /manhours/1.json
  def show
  end

  # GET /manhours/new
  def new
    @manhour = Manhour.new
  end

  # GET /manhours/1/edit
  def edit
  end

  # POST /manhours
  # POST /manhours.json
  def create
    @manhour = Manhour.new(manhour_params)

    respond_to do |format|
      if @manhour.save
        format.html { redirect_to @manhour, notice: 'Manhour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @manhour }
      else
        format.html { render action: 'new' }
        format.json { render json: @manhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manhours/1
  # PATCH/PUT /manhours/1.json
  def update
    respond_to do |format|
      if @manhour.update(manhour_params)
        format.html { redirect_to @manhour, notice: 'Manhour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @manhour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manhours/1
  # DELETE /manhours/1.json
  def destroy
    @manhour.destroy
    respond_to do |format|
      format.html { redirect_to manhours_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manhour
      @manhour = Manhour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manhour_params
      params.require(:manhour).permit(:heading, :union147, :union15,:union14,:union731,:union3)
    end
end
