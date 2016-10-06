class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :is_authenticated, except: [:index, :show]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
    @patient_appointments = Appointment.where(patient_id: current_patient.id)
    @specialties = Specialty.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create

    # physician = Physician.find(physician_id)
    # unless physician.patients.where(email: email).exists?
    #   patient = Patient.find_or_create_by(email: email)
    #   physician.appointments.create(patient: patient)

    unless Appointment.where(doctor_id: appointment_params[:doctor_id], appointment_date_id: appointment_params[:appointment_date_id], time_table_id: appointment_params[:time_table_id]).exists?
    # unless Appointment.where(doctor_id: requested_doctor, appointment_date_id: requested_date, time_table_id: requested_timing).exists?
      @appointment = Appointment.new(appointment_params)
      @patient_id = @current_patient.id
    end

    # if @appointment.try(:save)
    # if !@appointment.nil? && @appointment.save
    if @appointment && @appointment.save
      puts "Im saving!"
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      puts "Failed saving!"
      redirect_to new_appointment_url, notice: 'Appointment was NOT successfully created.'
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date_id, :time_table_id)
    end

    # def requested_doctor
    #   params.require(:appointment).permit(:doctor_id)
    # end
    #
    # def requested_date
    #   params.require(:appointment).appointment_date_id
    # end
    #
    # def requested_timing
    #   params.require(:appointment).time_table_id
    # end
end
