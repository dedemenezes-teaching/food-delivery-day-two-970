class SessionsView
  def ask_for(item)
    puts "#{item.capitalize}?"
    gets.chomp
  end

  def try_again
    puts "Wrong credentials...Try again!"
  end

  def welcome(employee)
    puts "Welcome #{employee.username}"
  end
end
