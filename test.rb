require_relative './app/repositories/employee_repository'

repo = EmployeeRepository.new('data/employees.csv')
p repo
