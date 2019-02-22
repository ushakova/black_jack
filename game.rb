class Game
  def initialize
    add_entities
  end

  def play_game
    deal_cards
    make_bets
    loop do
      puts 'Your cards:'
      @user.show_cards
      choose_action
      @dealer.make_move(cards_opened: @user.cards_were_opened)
      puts Calculator.new(@user, @dealer, @bank).calculate if game_over?
      break if game_over?
    end
  end

  private

  def add_entities
    add_user
    @dealer = Dealer.new
    @bank = Bank.new
  end

  def add_user
    puts 'Enter name:'
    name = gets.chomp
    @user = User.new(name)
  end

  def make_bets
    [@user, @dealer].each { |player| player.make_bet(@bank) }
  end

  def deal_cards
    [@user, @dealer].each { |player| @dealer.deal_cards(player) }
  end

  def choose_action
    puts '1. Skip turn'
    puts '2. Open cards'
    puts '3. Take one more card' if @user.can_take_more_cards?
    choise = gets.to_i
    make_move(choise)
  end

  def make_move(choise)
    case choise
    when 1 then return
    when 2 then @user.open_cards
    when 3 then @dealer.give_card(@user)
    else choose_action
    end
    @user.open_cards if no_more_turns?
  end

  def game_over?
    @user.cards_were_opened
  end

  def no_more_turns?
    !@user.can_take_more_cards?
  end
end
