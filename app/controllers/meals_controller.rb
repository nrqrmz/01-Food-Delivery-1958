require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_user_for('meal name')
    price = @view.ask_user_for('meal price').to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
    display_meals
  end

  def list
    display_meals
  end

  private

  def display_meals
    meals = @meal_repository.all
    @view.display(meals)
  end
end
