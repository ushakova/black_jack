class Game
  attr_reader :interface

  def initialize
    @interface = Interface.new
    @dealer = Dealer.new
    @bank = Bank.new
    add_user
  end

  def play_game
    deal_cards
    make_bets
    loop do
      @interface.players_cards(@user)
      @user.hand.show_cards
      choose_action
      dealers_move
      @interface.show_result(@user, @dealer, @bank) if game_over?
      break if game_over?
    end
  end

  private

  def add_user
    name = @interface.enter_name
    @user = Player.new(name)
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
    when 2 then open_cards
    when 3 then @dealer.give_card(@user)
    else choose_action
    end
    open_cards if no_more_turns?
  end

  def open_cards
    @interface.players_cards(@user)
    @user.hand.open_cards
    @interface.next_line
  end

  def dealers_move
    @interface.players_cards(@dealer) if game_over?
    @dealer.make_move(cards_opened: game_over?)
    @interface.next_line
  end

  def game_over?
    @user.hand.cards_were_opened
  end

  def no_more_turns?
    !@user.hand.can_take_more_cards?
  end
end
