class EmployeeSessionEventsController < ApplicationController
  before_action :set_employee_session_event, only: [:show, :edit, :update, :destroy]

  # GET /employee_session_events
  # GET /employee_session_events.json
  def index
    @employee_session_events = EmployeeSessionEvent.all
  end

  # GET /employee_session_events/1
  # GET /employee_session_events/1.json
  def show
  end

  # GET /employee_session_events/new
  def new
    @employee_session_event = EmployeeSessionEvent.new
  end

  # GET /employee_session_events/1/edit
  def edit
  end

  # POST /employee_session_events
  # POST /employee_session_events.json
  def create
    @employee_session_event = EmployeeSessionEvent.new(employee_session_event_params)

    respond_to do |format|
      if @employee_session_event.save
        format.html { redirect_to @employee_session_event, notice: 'Employee session event was successfully created.' }
        format.json { render :show, status: :created, location: @employee_session_event }
      else
        format.html { render :new }
        format.json { render json: @employee_session_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_session_events/1
  # PATCH/PUT /employee_session_events/1.json
  def update
    respond_to do |format|
      if @employee_session_event.update(employee_session_event_params)
        format.html { redirect_to @employee_session_event, notice: 'Employee session event was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_session_event }
      else
        format.html { render :edit }
        format.json { render json: @employee_session_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_session_events/1
  # DELETE /employee_session_events/1.json
  def destroy
    @employee_session_event.destroy
    respond_to do |format|
      format.html { redirect_to employee_session_events_url, notice: 'Employee session event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_session_event
      @employee_session_event = EmployeeSessionEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_session_event_params
      params.require(:employee_session_event).permit(:id_employee, :workday, :id_system, :id_event, :importance, :eventtime)
    end
end
