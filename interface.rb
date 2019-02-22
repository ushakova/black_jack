class Interface
  def users_cards
    puts 'Your cards:'
  end

  def enter_name
    puts 'Enter name:'
    gets.chomp
  end

  def show_available_actions(can_take_more_cards)
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
end
