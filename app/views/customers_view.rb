class CustomersView
  def display(customers_array)
    customers_array.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for(anything)
    puts "#{anything.capitalize}?"
    gets.chomp
  end
end
