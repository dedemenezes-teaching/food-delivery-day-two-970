require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # 1. ask the repo for the meals
    meals = @meal_repository.all
    # 2. ask the view to display the meals
    @meals_view.display(meals)
  end

  def add
    # 1. Ask the user for the name (VIEW)
    name = @meals_view.ask_for('name')
    # 2. Ask the user for the price
    price = @meals_view.ask_for('price').to_i
    # 3. create the meal
    meal = Meal.new(name: name, price: price)
    # 4. send to the repo, to STORE IT
    @meal_repository.create(meal)
  end
end
