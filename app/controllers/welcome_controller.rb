class WelcomeController < ApplicationController

  def index
  end

  def upload
    uploaded_file = params[:jsonfile][:file]
    path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
    File.open(path, 'wb') do |file|
      file.write(uploaded_file.read)
    end

    uploaded_file1 = params[:jsonfile][:file1]
    path1 = Rails.root.join('public', 'uploads', uploaded_file1.original_filename)
    File.open(path1, 'wb') do |file|
      file.write(uploaded_file1.read)
    end

    require 'json'
    systemsession_cash = Systemsession.all
    systemsession_cash.delete_all
    fileread = File.read(path)
    data_hash = JSON.parse(fileread)
    systemsessions, batch_size = [], 1000
    data_hash.each do |d|
      systemsession = Systemsession.new
      systemsession[:id_employee] = d["user_id"]
      date = DateTime.parse(d["started_at"])
      systemsession[:workday] = date.to_date
      systemsession[:entrytime] = date.to_time
      systemsessions << systemsession
      if systemsessions.size >= batch_size
        Systemsession.import systemsessions
        systemsessions = []
      end
    end
    Systemsession.import systemsessions

    event_cash = Event.all
    event_cash.delete_all
    fileread1 = File.read(path1)
    data_hash1 = JSON.parse(fileread1)
    events = []
    data_hash1.each do |d|
      event = Event.new
      event[:id_event] = check_event(d[0])
      event[:id_employee] = d[2]
      date = DateTime.parse(d[1])
      event[:workday] = date.to_date
      event[:eventtime] = date.to_time
      events << event
      if events.size >= batch_size
        Event.import events
        events = []
      end
    end
    Event.import events
    self.reload

    redirect_to(root_path, notice: 'Файл загружен.')
  end

  def reload
    #systemsessions = Systemsession.all.to_a.inject(Hash.new{ |h,k| h[k] = []}){ |h,i| h[i.id_employee] << i; h}

    # systemsessions = Systemsession.all
    # employeeSessions, batch_size = [], 1000
    #
    # systemsessions.each do |s|
    #   if (s.id_employee.present?)
    #     employeeSession = EmployeeSession.new
    #     employeeSession[:id_employee] = s.id_employee
    #     employeeSession[:workday] = s.workday
    #     employeeSession[:entrytime] = s.entrytime
    #     employeeSessions << employeeSession
    #     if employeeSessions.size >= batch_size
    #       EmployeeSession.import employeeSessions
    #       employeeSessions = []
    #     end
    #   end
    # end
    # EmployeeSession.import employeeSessions

    employeeSessionEvents, batch_size = [], 1000
    events = Event.all
    events.each do |e|
      if (e.id_employee.present?)
        employeeSessionEvent = EmployeeSessionEvent.new
        employeeSessionEvent[:id_event] = e.id_event
        employeeSessionEvent[:id_employee] = e.id_employee
        employeeSessionEvent[:workday] = e.workday
        employeeSessionEvent[:eventtime] = e.eventtime
        employeeSessionEvents << employeeSessionEvent
        if employeeSessionEvents.size >= batch_size
          EmployeeSessionEvent.import employeeSessionEvents
          employeeSessionEvents = []
        end
      end
    end
    EmployeeSessionEvent.import employeeSessionEvents
  end

  private

  def check_event(str)
    tmp = 0
    if (str.eql?("update"))
      tmp = 1
    elsif (str.eql?("create"))
      tmp = 2
    elsif (str.eql?("destroy"))
      tmp = 3
    end
    tmp
  end
end
