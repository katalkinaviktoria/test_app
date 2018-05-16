class EmployeeSessionsController < ApplicationController
  before_action :set_employee_session, only: [:show, :edit, :update, :destroy]

  # GET /employee_sessions
  # GET /employee_sessions.json
  def index
    @employee_sessions = EmployeeSession.all
  end

  # GET /employee_sessions/1
  # GET /employee_sessions/1.json
  def show
  end

  # GET /employee_sessions/new
  def new
    @employee_session = EmployeeSession.new
  end

  # GET /employee_sessions/1/edit
  def edit
  end

  # POST /employee_sessions
  # POST /employee_sessions.json
  def create
    @employee_session = EmployeeSession.new(employee_session_params)

    respond_to do |format|
      if @employee_session.save
        format.html { redirect_to @employee_session, notice: 'Employee session was successfully created.' }
        format.json { render :show, status: :created, location: @employee_session }
      else
        format.html { render :new }
        format.json { render json: @employee_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_sessions/1
  # PATCH/PUT /employee_sessions/1.json
  def update
    respond_to do |format|
      if @employee_session.update(employee_session_params)
        format.html { redirect_to @employee_session, notice: 'Employee session was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_session }
      else
        format.html { render :edit }
        format.json { render json: @employee_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_sessions/1
  # DELETE /employee_sessions/1.json
  def destroy
    @employee_session.destroy
    respond_to do |format|
      format.html { redirect_to employee_sessions_url, notice: 'Employee session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_session
      @employee_session = EmployeeSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_session_params
      params.require(:employee_session).permit(:id_employee, :workday, :id_system, :entrytime, :exittime)
    end
end
