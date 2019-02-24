class Dealer < Player
  def initialize
    @cards_deck = CardsDeck.new
    super('Dealer')
  end

  def deal_cards(player)
    player.new_round
    2.times { give_card(player) }
  end

  def give_card(player)
    return unless player.hand.can_take_more_cards?

    player.hand.take_card(@cards_deck.take_card)
  end

  def make_move(cards_opened: nil)
    hand.show_cards && return if cards_opened
    return if hand.total_score > 17

    give_card(self) if hand.can_take_more_cards?
  end
end
