require 'csv'
require_relative '../models/customer'
require_relative 'base_repository'
require_relative '../models/customer'


class CustomerRepository < BaseRepository
  def initialize(csv_file_path)
    super(csv_file_path, Customer)
  end
end
