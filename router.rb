# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      # 1. display the menu
      display_menu
      # 2. get the user action
      action = gets.chomp.to_i
      print `clear`
      # 3. dispatch to the right controller method
      dispatch(action)
    end
  end

  def dispatch(user_action)
    case user_action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0
      @running = false
      puts 'See youuu'
    else
      puts 'Try again...'
    end
  end

  def display_menu
    puts "choose an action"
    puts '1 - List all meals'
    puts '2 - Add a new meal'
    puts '3 - List all customers'
    puts '4 - Add a new customer'
    puts '0 - Quit'
  end
end
