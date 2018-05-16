require 'test_helper'

class EmployeeSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_session = employee_sessions(:one)
  end

  test "should get index" do
    get employee_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_session_url
    assert_response :success
  end

  test "should create employee_session" do
    assert_difference('EmployeeSession.count') do
      post employee_sessions_url, params: { employee_session: { entrytime: @employee_session.entrytime, exittime: @employee_session.exittime, id_employee: @employee_session.id_employee, id_system: @employee_session.id_system, workday: @employee_session.workday } }
    end

    assert_redirected_to employee_session_url(EmployeeSession.last)
  end

  test "should show employee_session" do
    get employee_session_url(@employee_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_session_url(@employee_session)
    assert_response :success
  end

  test "should update employee_session" do
    patch employee_session_url(@employee_session), params: { employee_session: { entrytime: @employee_session.entrytime, exittime: @employee_session.exittime, id_employee: @employee_session.id_employee, id_system: @employee_session.id_system, workday: @employee_session.workday } }
    assert_redirected_to employee_session_url(@employee_session)
  end

  test "should destroy employee_session" do
    assert_difference('EmployeeSession.count', -1) do
      delete employee_session_url(@employee_session)
    end

    assert_redirected_to employee_sessions_url
  end
end
