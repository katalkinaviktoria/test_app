json.extract! employee_session, :id, :id_employee, :workday, :id_system, :entrytime, :exittime, :created_at, :updated_at
json.url employee_session_url(employee_session, format: :json)
