class Game
  attr_reader :interface

  def initialize
    add_entities
  end

  def play_game
    deal_cards
    make_bets
    loop do
      @interface.users_cards
      @user.hand.show_cards
      choose_action
      @dealer.make_move(cards_opened: @user.hand.cards_were_opened)
      puts Calculator.new(@user, @dealer, @bank).calculate if game_over?
      break if game_over?
    end
  end

  private

  def add_entities
    @interface = Interface.new
    @dealer = Dealer.new
    @bank = Bank.new
    add_user
  end

  def add_user
    name = @interface.enter_name
    @user = User.new(name)
  end

  def make_bets
    [@user, @dealer].each { |player| player.make_bet(@bank) }
  end

  def deal_cards
    [@user, @dealer].each { |player| @dealer.deal_cards(player) }
  end

  def choose_action
    choise = @interface.show_available_actions(@user.hand.can_take_more_cards?)
    make_move(choise)
  end

  def make_move(choise)
    case choise
    when 1 then return
    when 2 then @user.hand.open_cards
    when 3 then @dealer.give_card(@user)
    else choose_action
    end
    @user.hand.open_cards if no_more_turns?
  end

  def game_over?
    @user.hand.cards_were_opened
  end

  def no_more_turns?
    !@user.hand.can_take_more_cards?
  end
end
