class MealsView
  def display(meals_array)
    meals_array.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name} - $#{meal.price}"
    end
  end

  def ask_for(anything)
    puts "#{anything.capitalize}?"
    gets.chomp
  end
end
