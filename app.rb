# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative './app/repositories/meal_repository'
require_relative './app/controllers/meals_controller'
require_relative './app/repositories/customer_repository'
require_relative './app/repositories/employee_repository'
require_relative './app/controllers/customers_controller'
require_relative './app/controllers/sessions_controller'
require_relative 'router'


meals_csv_file_path = './data/meals.csv'
customers_csv_file_path = './data/customers.csv'
employees_csv_file_path = './data/employees.csv'

meal_repository = MealRepository.new(meals_csv_file_path)
customer_repository = CustomerRepository.new(customers_csv_file_path)
employee_repository = EmployeeRepository.new(employees_csv_file_path)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
