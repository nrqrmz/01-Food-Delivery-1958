class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    welcome

    while @running
      user_action = menu_and_action
      dispatch(user_action)
    end

    good_bye
  end

  private

  def stop!
    @running = false
  end

  def dispatch(action)
    print `clear`
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then stop!
    else
      puts 'Invalid option...'
    end
  end

  def menu_and_action
    options = ['Add a meal', 'List all meals', 'Add a customer', 'List all customers', 'Exit']
    puts "\nPlease choose an option:"
    puts '-' * 24
    options.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    gets.chomp.to_i
  end

  def good_bye
    puts 'Good bye...'
  end

  def welcome
    puts '-' * 28
    puts 'Welcome to Food Delivery 1.0'
    puts '-' * 28
  end
end
