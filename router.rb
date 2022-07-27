# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      # LOGIN => Sessions
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager?
          display_manager_menu
          action = gets.chomp.to_i
          print `clear`
          dispatch_manager(action)
        else
          display_rider_menu
          action = gets.chomp.to_i
          print `clear`
          dispatch_rider(action)
        end
      end
    end
  end

  def dispatch_manager(user_action)
    case user_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @employee = nil
    when 0
      @running = false
      @employee = nil
      puts 'See youuu'
    else
      puts 'Try again...'
    end
  end

  def display_manager_menu
    puts "choose an action"
    puts '1 - List all meals'
    puts '2 - Add a new meal'
    puts '3 - List all customers'
    puts '4 - Add a new customer'
    puts '9 - Logout'
    puts '0 - Quit'
  end

  def display_rider_menu
    puts "choose an action"
    puts "1 - Mark one of my orders as delivered"
    puts "2 - list all my undelivered orders"
    puts '9 - Logout'
    puts '0 - Quit'
  end

  def dispatch_rider(action)
    case action
    when 1 then puts "TODO"
    when 9 then @employee = nil
    when 0
      @running = false
      @employee = nil
      puts 'See youuu'
    else
      puts "Try again.."
    end
  end
end
