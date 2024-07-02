class DatabreachesController < ApplicationController
  before_action :set_databreach, only: %i[ show edit update destroy ]

  def charts
    @message = "Charts!"
    @br = Databreach.fetch_all_breaches.to_json
  end

  # GET /databreaches or /databreaches.json
  def index
    @databreaches = Databreach.all
  end

  # GET /databreaches/1 or /databreaches/1.json
  def show
  end

  # GET /databreaches/new
  def new
    @databreach = Databreach.new
  end

  # GET /databreaches/1/edit
  def edit
  end

  # POST /databreaches or /databreaches.json
  def create
    @databreach = Databreach.new(databreach_params)

    respond_to do |format|
      if @databreach.save
        format.html { redirect_to databreach_url(@databreach), notice: "Databreach was successfully created." }
        format.json { render :show, status: :created, location: @databreach }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @databreach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /databreaches/1 or /databreaches/1.json
  def update
    respond_to do |format|
      if @databreach.update(databreach_params)
        format.html { redirect_to databreach_url(@databreach), notice: "Databreach was successfully updated." }
        format.json { render :show, status: :ok, location: @databreach }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @databreach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /databreaches/1 or /databreaches/1.json
  def destroy
    @databreach.destroy!

    respond_to do |format|
      format.html { redirect_to databreaches_url, notice: "Databreach was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_databreach
      @databreach = Databreach.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def databreach_params
      params.fetch(:databreach, {})
    end

  def get_organisation(organisation)
    results = Databreach.find_by(organisation)
    render json: results.to_json
  end

  def org_params
    params.require(:organisation).permit(:alternative_name, :search)
  end

end
