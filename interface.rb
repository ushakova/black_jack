class Interface
  def users_cards
    puts 'Your cards:'
  end

  def dealers_cards
    puts 'Dealers cards:'
  end

  def enter_name
    puts 'Enter name:'
    gets.chomp
  end

  def show_available_actions(can_take_more_cards)
    next_line
    puts '1. Skip turn'
    puts '2. Open cards'
    puts '3. Take one more card' if can_take_more_cards
    gets.to_i
  end

  def continue?
    puts 'Continue?(y/n)'
    choise = gets.chomp
    choise == 'y'
  end

  def show_result(user, dealer, bank)
    puts Calculator.new(user, dealer, bank).calculate
  end

  def next_line
    puts
  end
end
