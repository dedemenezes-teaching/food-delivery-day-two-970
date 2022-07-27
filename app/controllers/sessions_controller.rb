require_relative '../views/sessions_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    # 1. Ask for the username
    username = @view.ask_for(:username)
    # 2. Ask for the password
    password = @view.ask_for(:password)
    # 3. Find the employee with the username
    employee = @employee_repository.find_by_username(username)
    # 4. Compare the password with the one in the database
    if employee && employee.password == password
      # LOGIN MY USER
      @view.welcome(employee)
      employee
    else
      # say to my user to try again
      @view.try_again
      login
    end
  end

end
