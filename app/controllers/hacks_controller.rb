class HacksController < ApplicationController
  before_action :set_hack, only: %i[ show edit update destroy addpic ]
  def addpic
  @hack.images << [Image.new(hack_id: @hack.id)]
  end

  # GET /hacks or /hacks.json
  def index
    @hacks = Hack.all
  end

  # GET /hacks/1 or /hacks/1.json
  def show
  end

  # GET /hacks/new
  def new
    @hack = Hack.new
  end

  # GET /hacks/1/edit
  def edit
  end

  # POST /hacks or /hacks.json
  def create
    @hack = Hack.new(hack_params)

    respond_to do |format|
      if @hack.save
        format.html { redirect_to hack_url(@hack), notice: "Hack was successfully created." }
        format.json { render :show, status: :created, location: @hack }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hacks/1 or /hacks/1.json
  def update
    respond_to do |format|
      if @hack.update(hack_params)
        format.html { redirect_to hack_url(@hack), notice: "Hack was successfully updated." }
        format.json { render :show, status: :ok, location: @hack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacks/1 or /hacks/1.json
  def destroy
    @hack.destroy

    respond_to do |format|
      format.html { redirect_to hacks_url, notice: "Hack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hack
      @hack = Hack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hack_params
      params.require(:hack).permit(:title, :description, :user_id, :images_attributes=>{})
    end
end
