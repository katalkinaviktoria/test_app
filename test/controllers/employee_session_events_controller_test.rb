require 'test_helper'

class EmployeeSessionEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee_session_event = employee_session_events(:one)
  end

  test "should get index" do
    get employee_session_events_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_session_event_url
    assert_response :success
  end

  test "should create employee_session_event" do
    assert_difference('EmployeeSessionEvent.count') do
      post employee_session_events_url, params: { employee_session_event: { eventtime: @employee_session_event.eventtime, id_employee: @employee_session_event.id_employee, id_event: @employee_session_event.id_event, id_system: @employee_session_event.id_system, importance: @employee_session_event.importance, workday: @employee_session_event.workday } }
    end

    assert_redirected_to employee_session_event_url(EmployeeSessionEvent.last)
  end

  test "should show employee_session_event" do
    get employee_session_event_url(@employee_session_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_session_event_url(@employee_session_event)
    assert_response :success
  end

  test "should update employee_session_event" do
    patch employee_session_event_url(@employee_session_event), params: { employee_session_event: { eventtime: @employee_session_event.eventtime, id_employee: @employee_session_event.id_employee, id_event: @employee_session_event.id_event, id_system: @employee_session_event.id_system, importance: @employee_session_event.importance, workday: @employee_session_event.workday } }
    assert_redirected_to employee_session_event_url(@employee_session_event)
  end

  test "should destroy employee_session_event" do
    assert_difference('EmployeeSessionEvent.count', -1) do
      delete employee_session_event_url(@employee_session_event)
    end

    assert_redirected_to employee_session_events_url
  end
end
