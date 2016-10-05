class AppointmentDatesController < ApplicationController
  before_action :set_appointment_date, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, except: [:index, :show]

  # GET /appointment_dates
  # GET /appointment_dates.json
  def index
    @appointment_dates = AppointmentDate.all
  end

  # GET /appointment_dates/1
  # GET /appointment_dates/1.json
  def show
  end

  # GET /appointment_dates/new
  def new
    @appointment_date = AppointmentDate.new
  end

  # GET /appointment_dates/1/edit
  def edit
  end

  # POST /appointment_dates
  # POST /appointment_dates.json
  def create
    @appointment_date = AppointmentDate.new(appointment_date_params)

    respond_to do |format|
      if @appointment_date.save
        format.html { redirect_to @appointment_date, notice: 'Appointment date was successfully created.' }
        format.json { render :show, status: :created, location: @appointment_date }
      else
        format.html { render :new }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointment_dates/1
  # PATCH/PUT /appointment_dates/1.json
  def update
    respond_to do |format|
      if @appointment_date.update(appointment_date_params)
        format.html { redirect_to @appointment_date, notice: 'Appointment date was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment_date }
      else
        format.html { render :edit }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_dates/1
  # DELETE /appointment_dates/1.json
  def destroy
    @appointment_date.destroy
    respond_to do |format|
      format.html { redirect_to appointment_dates_url, notice: 'Appointment date was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment_date
      @appointment_date = AppointmentDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_date_params
      params.require(:appointment_date).permit(:date)
    end
end
