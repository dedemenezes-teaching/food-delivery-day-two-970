require_relative './app/repositories/customer_repository'

repo = CustomerRepository.new('data/customers.csv')
p repo
