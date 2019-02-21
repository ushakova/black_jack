class Dealer < Player
  def initialize
    @cards_deck = CardsDeck.new
    @cards = []
    @balance = 100
  end

  def deal_cards(player)
    player.new_round
    2.times { give_card(player) }
  end

  def give_card(player)
    return unless player.can_take_more_cards?

    player.cards << @cards_deck.take_card
  end

  def make_move(cards_opened: nil)
    show_cards && return if cards_opened
    return if score > 17

    give_card(self) if can_take_more_cards?
  end
end
