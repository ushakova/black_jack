class EmptyDeck < RuntimeError; end
class CardsDeck
  attr_accessor :cards

  def initialize
    @cards = []
    add_all_cards
  end

  def take_card
    raise EmptyDeck if cards.size.zero?

    card = cards[rand(cards.size)]
    cards.delete(card)
    card
  end

  private

  def add_all_cards
    Card::SUITS.each do |suit|
      ('2'..'9').each do |value|
        cards << Card.new(suit, value)
      end

      Card::PICTURES.each do |value|
        cards << Card.new(suit, value)
      end
    end
  end
end
