require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # 1. ask the repo for the customers
    customers = @customer_repository.all
    # 2. ask the view to display the customers
    @customers_view.display(customers)
  end

  def add
    # 1. Ask the user for the name (VIEW)
    name = @customers_view.ask_for('name')
    # 2. Ask the user for the price
    address = @customers_view.ask_for('address')
    # 3. create the customer
    customer = Customer.new(name: name, address: address)
    # 4. send to the repo, to STORE IT
    @customer_repository.create(customer)
  end
end
